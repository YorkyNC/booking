import 'dart:developer';

import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/services/injectable/injectable_service.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:booking/src/features/history/presentation/bloc/history_bloc.dart';
import 'package:booking/src/features/history/presentation/components/booking_card.dart';
import 'package:booking/src/features/history/presentation/components/custom_dialog.dart';
import 'package:booking/src/features/seat/bloc/bloc/seat_bloc.dart';
import 'package:booking/src/features/seat/domain/requests/cancel_reservation_request.dart';
import 'package:booking/src/features/seat/domain/requests/repeat_last_request.dart';
import 'package:booking/src/features/student/domain/requests/get_stat_request.dart';
import 'package:booking/src/features/student/presentation/bloc/stat_bloc.dart';
import 'package:booking/src/features/student/presentation/components/common_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({super.key});

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

class _StudentMainPageState extends State<StudentMainPage> {
  void _handleCancellationSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Reservation cancelled successfully'),
        backgroundColor: context.colors.success500,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _handleCancellationError(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        backgroundColor: context.colors.error500,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: context.colors.white,
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      ),
    );
  }

  void _showCancelDialog(BuildContext context, int bookingId, SeatBloc seatBloc) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => CustomDialog(
        title: 'Cancel Reservation',
        message: 'Are you sure you want to cancel this reservation? This action cannot be undone.',
        confirmText: 'Yes, Cancel',
        cancelText: context.loc.no ?? 'Keep Reservation',
        icon: Icons.warning_rounded,
        iconColor: context.colors.error500,
        onConfirm: () => _handleCancelConfirm(dialogContext, bookingId, seatBloc),
        onCancel: () => Navigator.of(dialogContext).pop(),
        confirmColor: context.colors.error500,
      ),
    );
  }

  void _handleCancelConfirm(BuildContext dialogContext, int bookingId, SeatBloc seatBloc) {
    Navigator.of(dialogContext).pop();
    seatBloc.add(
      SeatEvent.cancelReservation(
        CancelReservationRequest(id: bookingId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    log(st.getUserId().toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.gray100,
        centerTitle: true,
        title: Text(
          'Welcome back, West side!',
          style: context.typography.displayxsSemibold.copyWith(
            color: context.colors.black,
          ),
        ),
      ),
      backgroundColor: context.colors.gray100,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final userId = st.getUserId();
              if (userId == null) {
                // Handle the case when userId is null
                return getIt<StatBloc>();
              }
              return getIt<StatBloc>()
                ..add(
                  StatEvent.getStat(
                    GetStatRequest(userId: userId),
                  ),
                );
            },
          ),
          BlocProvider(
            create: (context) {
              final userId = st.getUserId();
              if (userId == null) {
                // Handle the case when userId is null
                return getIt<HistoryBloc>();
              }
              return getIt<HistoryBloc>()
                ..add(
                  HistoryEvent.getHistory(
                    GetHistoryRequest(userId: userId),
                  ),
                );
            },
          ),
          BlocProvider(
            create: (context) => getIt<SeatBloc>(),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<HistoryBloc, HistoryState>(
              listener: (context, state) {
                // Handle any state changes if needed
              },
            ),
            BlocListener<SeatBloc, SeatState>(
              listener: (context, state) {
                state.maybeWhen(
                  error: (error) {
                    _handleCancellationError(context, error);
                  },
                  orElse: () {},
                );
              },
            ),
          ],
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    BlocBuilder<StatBloc, StatState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          error: (error) => Text(
                            error,
                            style: context.typography.textmdMedium.copyWith(
                              color: context.colors.error500,
                            ),
                          ),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          orElse: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          loaded: (viewModel) {
                            final stat = viewModel.stat;
                            if (stat == null) {
                              return const Center(
                                child: Text('No statistics available'),
                              );
                            }
                            return IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(24),
                                      decoration: BoxDecoration(
                                        color: context.colors.containerPurple,
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'You are in the Library',
                                            style: context.typography.textlgBold.copyWith(
                                              color: context.colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Text(
                                            '${stat.hoursInLibrary} Hours',
                                            style: context.typography.typography4Regular.copyWith(
                                              color: context.colors.black,
                                            ),
                                          ),
                                          Text(
                                            '${stat.minutesInLibrary} Min',
                                            style: context.typography.typography4Regular.copyWith(
                                              color: context.colors.black,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SvgPicture.asset(
                                                context.assetImages.timerVector,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                            decoration: BoxDecoration(
                                              color: context.colors.containerGreen,
                                              borderRadius: BorderRadius.circular(24),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'My bookings this month',
                                                        style: context.typography.textmdBold.copyWith(
                                                          color: context.colors.black,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        '${stat.bookingDaysInMonth} days',
                                                        style: context.typography.textmdMedium.copyWith(
                                                          color: context.colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                SvgPicture.asset(
                                                  context.assetImages.restoreVector,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF8E9B7),
                                              borderRadius: BorderRadius.circular(24),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'Record for the ${stat.recordDay} day',
                                                        style: context.typography.textmdBold.copyWith(
                                                          color: context.colors.black,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        '${stat.recordHours} hours',
                                                        style: context.typography.textmdMedium.copyWith(
                                                          color: context.colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Icon(
                                                  MdiIcons.trophy,
                                                  color: const Color(0xFFE4C248),
                                                  size: 36,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        context.push(RoutePaths.booking);
                      },
                      child: CommonContainer(
                        color: const Color(0xff5636B5),
                        title: 'Make a place reservation',
                        path: context.assetImages.a1Vector,
                      ),
                    ),
                    const SizedBox(height: 14),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        context.push(RoutePaths.history);
                      },
                      child: CommonContainer(
                        color: const Color(0xff35C1D6),
                        title: 'Check my bookings',
                        path: context.assetImages.a2Vector,
                      ),
                    ),
                    const SizedBox(height: 14),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        final userId = st.getUserId();
                        if (userId == null) {
                          _handleCancellationError(context, 'User ID not found. Please try logging in again.');
                          return;
                        }
                        getIt<SeatBloc>().add(
                          SeatEvent.repeatLast(
                            RepeatLastRequest(userId: userId),
                          ),
                        );
                      },
                      child: CommonContainer(
                        color: const Color(0xff35D642),
                        title: 'Repeat last booking',
                        path: context.assetImages.a3Vector,
                      ),
                    ),
                    const SizedBox(height: 14),
                    BlocBuilder<HistoryBloc, HistoryState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loaded: (viewModel) {
                            final history = viewModel.history;
                            if (history == null || history.isEmpty) {
                              return const SizedBox.shrink();
                            }

                            // Find the last active booking
                            final lastActiveBooking = history.firstWhere(
                              (booking) => booking.status.isActive,
                              orElse: () => history.first, // Return first booking if no active ones found
                            );

                            // Only show if it's an active booking
                            if (!lastActiveBooking.status.isActive) {
                              return const SizedBox.shrink();
                            }

                            return BookingCard(
                              startTime: lastActiveBooking.startTime,
                              endTime: lastActiveBooking.endTime,
                              floor: lastActiveBooking.floor.toString(),
                              sector: lastActiveBooking.seat.location,
                              row: lastActiveBooking.seat.number,
                              place: lastActiveBooking.seat.number,
                              status: lastActiveBooking.status,
                              showHeader: false,
                              onDelete: () =>
                                  _showCancelDialog(context, lastActiveBooking.id, context.read<SeatBloc>()),
                            );
                          },
                          orElse: () => const SizedBox.shrink(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
