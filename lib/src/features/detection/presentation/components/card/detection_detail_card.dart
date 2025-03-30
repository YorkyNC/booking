import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/popups/sheet_popup.dart';
import 'package:booking/src/features/detection/presentation/components/card/active_detection_card.dart';
import 'package:booking/src/features/schedule/presentation/components/editing_room_pop_up.dart';

class DetectionDetailCard extends StatelessWidget {
  final bool isDone;
  final String subjectName;
  final String room;
  final String purpose;
  const DetectionDetailCard({
    super.key,
    required this.isDone,
    required this.subjectName,
    required this.room,
    required this.purpose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ActiveDetectionCard(
                  icon: context.icons.open_book__content_books_book_open,
                  title: context.loc.lesson,
                  subTitle: subjectName,
                ),
                const SizedBox(width: 8),
                ActiveDetectionCard(
                  icon: context.icons.location_pin_3__navigation_map_maps_pin_gps_location,
                  title: context.loc.cabinet,
                  subTitle: room,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ActiveDetectionCard(
                  title: context.loc.coment,
                  subTitle: purpose,
                ),
              ],
            ),
            const SizedBox(height: 8),
            isDone
                ? const SizedBox()
                : Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: context.colors.black,
                            textStyle: context.typography.textsmSemibold,
                          ),
                          onPressed: () {
                            showSheetPopup(
                              title: Text(
                                context.loc.editing,
                                style: context.typography.textlgSemibold.copyWith(
                                  color: context.colors.black,
                                ),
                              ),
                              context,
                              builder: (value) {
                                return const EditingRoomPopUp(
                                  subjectName: 'Алгебра 1',
                                  className: '7Б класс',
                                  room: 'каб. 25',
                                );
                              },
                            );
                          },
                          child: const Text(
                            'Сменить кабинет',
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
