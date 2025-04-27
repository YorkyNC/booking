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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () => context.pop(),
        ),
        backgroundColor: Colors.grey.shade100,
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
              child: Text(
                error.toString(),
                style: context.typography.displayxsRegular.copyWith(
                  color: context.colors.error500,
                ),
              ),
            ),
            loaded: (viewModel) {
              final history = viewModel.history;
              print(history);
              if (history == null) {
                return Center(
                  child: Text(
                    'No booking history',
                    style: context.typography.displayxsRegular,
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  bloc.add(HistoryEvent.getHistory(GetHistoryRequest(userId: st.getUserId()!)));
                },
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: history
                        .map((booking) => BookingCard(
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
                            ))
                        .toList(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  BookingStatus _getBookingStatus(String status) {
    switch (status.toLowerCase()) {
      case 'ongoing':
        return BookingStatus.ongoing;
      case 'upcoming':
        return BookingStatus.upcoming;
      case 'ended':
        return BookingStatus.ended;
      case 'cancelled':
        return BookingStatus.cancelled;
      default:
        return BookingStatus.ended;
    }
  }
}
