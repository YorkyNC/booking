import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/history/domain/enum/booking_status.dart';
import 'package:booking/src/features/history/presentation/components/booking_card.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final startTime = DateTime(2025, 1, 17, 12, 0);
    final endTime = DateTime(2025, 1, 17, 14, 0);

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookingCard(
              startTime: startTime,
              endTime: endTime,
              floor: '1',
              sector: 'A',
              row: '2',
              place: '8',
              status: BookingStatus.ongoing,
            ),
            const SizedBox(height: 24),
            BookingCard(
              startTime: startTime,
              endTime: endTime,
              floor: '1',
              sector: 'A',
              row: '2',
              place: '8',
              status: BookingStatus.upcoming,
              onDelete: () {
                // Handle delete action
              },
            ),
            const SizedBox(height: 24),
            BookingCard(
              startTime: startTime,
              endTime: endTime,
              floor: '1',
              sector: 'A',
              row: '2',
              place: '8',
              status: BookingStatus.ended,
            ),
            const SizedBox(height: 24),
            BookingCard(
              startTime: startTime,
              endTime: endTime,
              floor: '1',
              sector: 'A',
              row: '2',
              place: '8',
              status: BookingStatus.cancelled,
              onDelete: () {
                // Handle delete action
              },
            ),
          ],
        ),
      ),
    );
  }
}
