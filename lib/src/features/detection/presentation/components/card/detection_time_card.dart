import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';
import 'package:booking/src/features/detection/presentation/components/custom_alert_dialog.dart';

class DetectionTimeCard extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;

  final bool isDone;
  const DetectionTimeCard({
    super.key,
    required this.isDone,
    required this.startTime,
    required this.endTime,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${startTime.formatTime}-${endTime.formatTime}',
                  style: context.typography.displaymdSemibold.copyWith(
                    color: context.colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  isDone ? context.loc.timeIsOver : endTime.getRemainingTimeText(context),
                  style: context.typography.textxsRegular.copyWith(
                    color: context.colors.gray500,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            isDone == true
                ? const Row(
                    children: [
                      SizedBox(),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: context.colors.brand600,
                          textStyle: context.typography.textsmSemibold,
                        ),
                        onPressed: () => (BuildContext context) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomAlertDialog(
                                backgorundColor: context.colors.success50,
                                iconColor: context.colors.success500,
                                title: 'Хотите добавить дополнительные 10 минут?',
                                subtitle: 'Детекция закончится в 08:55',
                              );
                            },
                          );
                        }(context),
                        child: const Text(
                          '+5 минут',
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: context.colors.brand600,
                          textStyle: context.typography.textsmSemibold,
                        ),
                        onPressed: () => (BuildContext context) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomAlertDialog(
                                backgorundColor: context.colors.success50,
                                iconColor: context.colors.success500,
                                title: 'Хотите добавить дополнительные 10 минут?',
                                subtitle: 'Детекция закончится в 08:55',
                              );
                            },
                          );
                        }(context),
                        child: const Text(
                          '+10 минут',
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
