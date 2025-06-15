import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/base/base_bloc/bloc/base_bloc_widget.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/services/injectable/injectable_service.dart';
import 'package:booking/src/features/history/domain/enum/booking_status.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:booking/src/features/history/presentation/bloc/history_bloc.dart';
import 'package:booking/src/features/history/presentation/components/booking_card.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray100,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: context.colors.black,
          ),
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
      ),
      body: BaseBlocWidget<HistoryBloc, HistoryEvent, HistoryState>(
        bloc: getIt<HistoryBloc>(),
        starterEvent: HistoryEvent.getHistory(GetHistoryRequest(userId: st.getUserId()!)),
        builder: (context, state, bloc) {
          return state.maybeWhen(
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    error.toString(),
                    style: context.typography.displayxsRegular.copyWith(
                      color: context.colors.error500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(HistoryEvent.getHistory(GetHistoryRequest(userId: st.getUserId()!)));
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
            loaded: (viewModel) {
              final history = viewModel.history;

              if (history == null || history.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history,
                        size: 64,
                        color: context.colors.gray400,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No booking history', // TODO: Add localization
                        style: context.typography.displayxsRegular.copyWith(
                          color: context.colors.gray500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  try {
                    await Future.delayed(const Duration(milliseconds: 500)); // Add slight delay for better UX
                    bloc.add(HistoryEvent.getHistory(GetHistoryRequest(userId: st.getUserId()!)));
                  } catch (e) {
                    // Handle any refresh errors silently
                    debugPrint('Refresh error: $e');
                  }
                },
                color: context.colors.buttonColor,
                backgroundColor: context.colors.white,
                strokeWidth: 3,
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(), // Enable scrolling even when content is small
                  padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 12.0),
                  itemCount: history.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final booking = history[index];
                    return BookingCard(
                      startTime: booking.startTime,
                      endTime: booking.endTime,
                      floor: booking.floor.toString(),
                      sector: booking.seat.number,
                      row: booking.seat.number,
                      place: booking.seat.location,
                      status: _getBookingStatus(booking.status),
                      onDelete: _getBookingStatus(booking.status) == BookingStatus.upcoming
                          ? () {
                              // TODO: Implement delete functionality
                            }
                          : null,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  BookingStatus _getBookingStatus(String status) {
    switch (status.toUpperCase()) {
      case 'ACTIVE':
        return BookingStatus.ongoing;
      case 'RESERVED':
        return BookingStatus.upcoming;
      case 'EXPIRED':
        return BookingStatus.ended;
      case 'CANCELLED':
        return BookingStatus.cancelled;
      default:
        return BookingStatus.ended;
    }
  }
}
