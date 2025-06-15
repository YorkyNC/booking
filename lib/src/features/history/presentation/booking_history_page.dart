import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/base/base_bloc/bloc/base_bloc_widget.dart';
import 'package:booking/src/core/extensions/booking_status_extension.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/services/injectable/injectable_service.dart';
import 'package:booking/src/features/history/domain/enum/booking_status.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:booking/src/features/history/presentation/bloc/history_bloc.dart';
import 'package:booking/src/features/history/presentation/components/booking_card.dart';
import 'package:booking/src/features/history/presentation/components/custom_dialog.dart';
import 'package:booking/src/features/seat/bloc/bloc/seat_bloc.dart';
import 'package:booking/src/features/seat/domain/requests/cancel_reservation_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SeatBloc>()),
        BlocProvider.value(value: getIt<HistoryBloc>()),
      ],
      child: const _BookingHistoryView(),
    );
  }
}

class _BookingHistoryView extends StatefulWidget {
  const _BookingHistoryView();

  @override
  State<_BookingHistoryView> createState() => _BookingHistoryViewState();
}

class _BookingHistoryViewState extends State<_BookingHistoryView> {
  BookingStatus? _selectedFilter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SeatBloc, SeatState>(
          listener: _handleSeatBlocState,
        ),
      ],
      child: Scaffold(
        backgroundColor: context.colors.gray100,
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.chevron_left, color: context.colors.black),
        onPressed: () => context.pop(),
      ),
      backgroundColor: context.colors.gray100,
      title: Text(
        context.loc.bookingHistory,
        style: context.typography.displayxsSemibold.copyWith(
          color: context.colors.black,
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget _buildBody(BuildContext context) {
    return BaseBlocWidget<HistoryBloc, HistoryEvent, HistoryState>(
      bloc: getIt<HistoryBloc>(),
      starterEvent: _getHistoryEvent(),
      builder: (context, state, bloc) {
        return state.maybeWhen(
          orElse: () => _buildLoadingState(),
          error: (error) => _buildErrorState(context, error, bloc),
          loaded: (viewModel) => _buildLoadedState(context, viewModel, bloc),
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorState(BuildContext context, dynamic error, HistoryBloc bloc) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: context.colors.error500,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load booking history',
              style: context.typography.displayxsSemibold.copyWith(
                color: context.colors.error500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: context.typography.textsmRegular.copyWith(
                color: context.colors.gray600,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => bloc.add(_getHistoryEvent()),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadedState(BuildContext context, dynamic viewModel, HistoryBloc bloc) {
    final history = viewModel.history;

    if (history == null || history.isEmpty) {
      return _buildEmptyState(context);
    }

    return _buildHistoryList(context, history, bloc);
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history_outlined,
              size: 80,
              color: context.colors.gray400,
            ),
            const SizedBox(height: 20),
            Text(
              'No booking history',
              style: context.typography.displayxsSemibold.copyWith(
                color: context.colors.gray600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Your booking history will appear here once you make a reservation.',
              style: context.typography.textsmRegular.copyWith(
                color: context.colors.gray500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    // Define the consolidated statuses to show in filters
    final filterStatuses = [
      BookingStatus.active,
      BookingStatus.reserved,
      BookingStatus.expired,
      BookingStatus.cancelled,
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        children: [
          FilterChip(
            label: const Text('All'),
            selected: _selectedFilter == null,
            onSelected: (selected) {
              setState(() {
                _selectedFilter = null;
              });
            },
            backgroundColor: context.colors.white,
            selectedColor: context.colors.buttonColor.withOpacity(0.1),
            checkmarkColor: context.colors.buttonColor,
            labelStyle: context.typography.textsmMedium.copyWith(
              color: _selectedFilter == null ? context.colors.buttonColor : context.colors.gray600,
            ),
          ),
          const SizedBox(width: 8),
          ...filterStatuses.map((status) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FilterChip(
                label: Text(status.label),
                selected: _selectedFilter == status,
                onSelected: (selected) {
                  setState(() {
                    _selectedFilter = selected ? status : null;
                  });
                },
                backgroundColor: context.colors.white,
                selectedColor: status.backgroundColor,
                checkmarkColor: status.color,
                labelStyle: context.typography.textsmMedium.copyWith(
                  color: _selectedFilter == status ? status.color : context.colors.gray600,
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildHistoryList(BuildContext context, List<dynamic> history, HistoryBloc bloc) {
    final filteredHistory = _selectedFilter == null
        ? history
        : history.where((booking) {
            final status = booking.status;
            // Handle consolidated statuses
            if (_selectedFilter == BookingStatus.active) {
              return status == BookingStatus.active || status == BookingStatus.ongoing;
            } else if (_selectedFilter == BookingStatus.reserved) {
              return status == BookingStatus.reserved || status == BookingStatus.upcoming;
            }
            return status == _selectedFilter;
          }).toList();

    if (filteredHistory.isEmpty) {
      return _buildEmptyFilteredState(context);
    }

    return RefreshIndicator(
      onRefresh: () => _handleRefresh(bloc),
      color: context.colors.buttonColor,
      backgroundColor: context.colors.white,
      strokeWidth: 3,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          _buildFilterChips(context),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            itemCount: filteredHistory.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => _buildBookingCard(context, filteredHistory[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyFilteredState(BuildContext context) {
    return ListView(
      children: [
        _buildFilterChips(context),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.filter_list,
                  size: 80,
                  color: context.colors.gray400,
                ),
                const SizedBox(height: 20),
                Text(
                  'No bookings found',
                  style: context.typography.displayxsSemibold.copyWith(
                    color: context.colors.gray600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Try selecting a different filter or check back later.',
                  style: context.typography.textsmRegular.copyWith(
                    color: context.colors.gray500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBookingCard(BuildContext context, dynamic booking) {
    final status = booking.status;
    debugPrint('📊 Booking ${booking.id}: ${status.value}');
    final seatBloc = context.read<SeatBloc>();

    return BookingCard(
      startTime: booking.startTime,
      endTime: booking.endTime,
      floor: booking.floor.toString(),
      sector: booking.seat.number,
      row: booking.seat.number,
      place: booking.seat.location,
      status: status,
      onDelete: status.canBeCancelled ? () => _showCancelDialog(context, booking.id, seatBloc) : null,
    );
  }

  void _handleSeatBlocState(BuildContext context, SeatState state) {
    state.maybeWhen(
      loaded: (viewModel) => _handleCancellationSuccess(context),
      error: (error) => _handleCancellationError(context, error),
      orElse: () {},
    );
  }

  void _handleCancellationSuccess(BuildContext context) {
    // Refresh history
    getIt<HistoryBloc>().add(_getHistoryEvent());

    // Show success message
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

  Future<void> _handleRefresh(HistoryBloc bloc) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      bloc.add(_getHistoryEvent());
    } catch (e) {
      debugPrint('⚠️ Refresh error: $e');
    }
  }

  // ===============================
  // 7. DIALOG HANDLING
  // ===============================

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

  // ===============================
  // 8. HELPER METHODS
  // ===============================

  HistoryEvent _getHistoryEvent() {
    final userId = st.getUserId();
    if (userId == null) {
      throw Exception('User ID not found');
    }
    return HistoryEvent.getHistory(GetHistoryRequest(userId: userId));
  }
}

// ===============================
// 9. CONSTANTS FOR MAGIC NUMBERS
// ===============================

class BookingHistoryConstants {
  static const double horizontalPadding = 24.0;
  static const double verticalPadding = 16.0;
  static const double cardSpacing = 16.0;
  static const double refreshDelay = 300; // milliseconds
  static const int maxErrorLines = 3;
  static const double iconSize = 64.0;
  static const double emptyStateIconSize = 80.0;
}
