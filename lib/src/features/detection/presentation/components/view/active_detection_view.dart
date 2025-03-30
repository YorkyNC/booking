import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/detection/domain/entity/detection_entity.dart';
import 'package:booking/src/features/detection/presentation/components/app_bar/active_detection_app_bar.dart';
import 'package:booking/src/features/detection/presentation/components/card/cheating_history_event_card.dart';
import 'package:booking/src/features/detection/presentation/components/card/detection_detail_card.dart';
import 'package:booking/src/features/detection/presentation/components/card/detection_time_card.dart';

class ActiveDetectionView extends StatelessWidget {
  final DetectionEntity detectionEntity;
  const ActiveDetectionView({super.key, required this.detectionEntity});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;
    return Scaffold(
      backgroundColor: context.colors.gray100,
      appBar: const ActiveDetectionAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                DetectionTimeCard(
                  isDone: false,
                  startTime: detectionEntity.startTime,
                  endTime: detectionEntity.endTime,
                ),
                const SizedBox(height: 12),
                DetectionDetailCard(
                  isDone: false,
                  subjectName: detectionEntity.subjectName,
                  room: detectionEntity.room!,
                  purpose: detectionEntity.purpose!,
                ),
                const SizedBox(height: 12),
                CheatingHistoryEventCard(colors: colors, typography: typography),
                CheatingHistoryEventCard(colors: colors, typography: typography),
                CheatingHistoryEventCard(colors: colors, typography: typography),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
