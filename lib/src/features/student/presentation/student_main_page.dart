import 'dart:developer';

import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/services/injectable/injectable_service.dart';
import 'package:booking/src/features/history/domain/enum/booking_status.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:booking/src/features/history/presentation/bloc/history_bloc.dart';
import 'package:booking/src/features/history/presentation/components/booking_card.dart';
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
            create: (context) => getIt<StatBloc>()
              ..add(
                StatEvent.getStat(
                  GetStatRequest(userId: st.getUserId()!),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => getIt<HistoryBloc>()
              ..add(
                HistoryEvent.getHistory(
                  GetHistoryRequest(userId: st.getUserId()!),
                ),
              ),
          ),
        ],
        child: BlocListener<HistoryBloc, HistoryState>(
          listener: (context, state) {
            // Handle any state changes if needed
          },
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
                        context.push(RoutePaths.booking);
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
                            final lastBooking = history.first;
                            return BookingCard(
                              startTime: lastBooking.startTime,
                              endTime: lastBooking.endTime,
                              floor: lastBooking.floor.toString(),
                              sector: lastBooking.seat.location,
                              row: lastBooking.seat.number,
                              place: lastBooking.seat.number,
                              status: BookingStatus.values.firstWhere(
                                (e) => e.toString().split('.').last == lastBooking.status,
                                orElse: () => BookingStatus.ongoing,
                              ),
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
