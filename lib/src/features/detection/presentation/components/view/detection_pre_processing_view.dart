import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/features/detection/domain/entity/detection_entity.dart';
import 'package:booking/src/features/detection/presentation/components/app_bar/detection_pre_processing_app_bar.dart';
import 'package:booking/src/features/detection/presentation/components/card/detection_detail_card.dart';
import 'package:booking/src/features/detection/presentation/components/card/detection_time_card.dart';

class DetectionPreProcessingView extends StatelessWidget {
  final DetectionEntity detectionEntity;
  const DetectionPreProcessingView({super.key, required this.detectionEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray100,
      appBar: DetectionPreProcessingAppBar(
        className: detectionEntity.classEntity.className,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Column(
              children: [
                DetectionTimeCard(
                  isDone: true,
                  startTime: detectionEntity.startTime,
                  endTime: detectionEntity.endTime,
                ),
                const SizedBox(height: 12),
                DetectionDetailCard(
                  isDone: true,
                  subjectName: detectionEntity.subjectName,
                  room: detectionEntity.room!,
                  purpose: detectionEntity.purpose!,
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            context.push(RoutePaths.detectionProcessing);
                          },
                          child: const Text(
                            'Обработать 22 события',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
