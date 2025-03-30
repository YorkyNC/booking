import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/widgets/popups/sheet_popup.dart';
import 'package:booking/src/features/detection/domain/entity/detection_date_entity.dart';
import 'package:booking/src/features/detection/domain/entity/detection_entity.dart';
import 'package:booking/src/features/detection/presentation/bloc/detection_bloc.dart';
import 'package:booking/src/features/detection/presentation/bloc/detection_state.dart';
import 'package:booking/src/features/detection/presentation/components/active_detection_shimmer.dart';
import 'package:booking/src/features/detection/presentation/components/app_bar/cheating_detecion_app_bar.dart';
import 'package:booking/src/features/detection/presentation/components/custom_alert_dialog.dart';
import 'package:booking/src/features/schedule/presentation/components/schedule_subject_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheatingDetectionPage extends StatefulWidget {
  const CheatingDetectionPage({super.key});

  @override
  State<CheatingDetectionPage> createState() => _CheatingDetectionPageState();
}

class _CheatingDetectionPageState extends State<CheatingDetectionPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetectionBloc(),
      child: Scaffold(
        backgroundColor: context.colors.gray100,
        appBar: const CheatingDetecionAppBar(),
        body: BlocBuilder<DetectionBloc, DetectionState>(
          builder: (context, state) {
            final detections = state.detection;

            if (detections == null) {
              return const ActiveDetectionShimmer();
            }
            final now = DateTime.now();
            final today = DateTime(now.year, now.month, now.day);

            DetectionEntity? activeDetection;
            for (final day in detections) {
              if (day.date.isAtSameMomentAs(today)) {
                for (final detection in day.detections) {
                  if (now.isAfter(detection.startTime) && now.isBefore(detection.endTime)) {
                    activeDetection = detection;
                    break;
                  }
                }
              }
              if (activeDetection != null) break;
            }

            final plannedDetections =
                detections.where((day) => day.date.isAtSameMomentAs(today) || day.date.isAfter(today)).toList();

            final historyDetections = detections.where((day) => day.date.isBefore(today)).toList();

            return SafeArea(
              child: NestedScrollView(
                physics: const ClampingScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    const SliverToBoxAdapter(
                      child: SizedBox(),
                    ),
                    if (activeDetection != null)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 12),
                            decoration: BoxDecoration(
                              color: context.colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  context.loc.activeDetection,
                                  style: context.typography.textmdSemibold.copyWith(
                                    color: context.colors.brand500,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        trailing: Text(
                                          activeDetection.room ?? "",
                                          style: context.typography.textxsRegular.copyWith(
                                            color: context.colors.gray500,
                                          ),
                                        ),
                                        title: Text(
                                          activeDetection.subjectName,
                                          style: context.typography.textsmSemibold.copyWith(
                                            color: context.colors.black,
                                          ),
                                        ),
                                        subtitle: Text(
                                          activeDetection.classEntity.className,
                                          style: context.typography.textxsRegular.copyWith(
                                            color: context.colors.gray500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Material(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  child: ListTile(
                                    onTap: () {
                                      context.push(RoutePaths.activeDetection, extra: activeDetection);
                                    },
                                    contentPadding: const EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    selected: true,
                                    selectedTileColor: context.colors.gray50,
                                    tileColor: Colors.white,
                                    selectedColor: context.colors.black,
                                    title: Column(
                                      children: [
                                        Text(
                                          '${activeDetection.startTime.formatTime}-${activeDetection.endTime.formatTime}',
                                          style: context.typography.displaymdSemibold.copyWith(
                                            color: context.colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          activeDetection.endTime.getRemainingTimeText(context),
                                          style: context.typography.textxsRegular.copyWith(
                                            color: context.colors.gray500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: Icon(
                                      context.icons.chevron_right,
                                      size: 24,
                                      color: context.colors.gray700,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    activeDetection.subjectName,
                                    style: context.typography.textxsRegular.copyWith(
                                      color: context.colors.gray500,
                                    ),
                                  ),
                                  subtitle: Text(
                                    activeDetection.purpose ?? context.loc.examination,
                                    style: context.typography.textsmMedium.copyWith(
                                      color: context.colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 8),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                          ).copyWith(topRight: const Radius.circular(12)),
                        ),
                        child: _buildTabBar(context),
                      ),
                    ),
                  ];
                },
                body: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                    ).copyWith(bottomRight: const Radius.circular(12)),
                  ),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildPlannedTab(context, plannedDetections),
                      _buildHistoryTab(context, historyDetections),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPlannedTab(BuildContext context, List<DetectionDateEntity> detections) {
    if (detections.isEmpty) {
      return Center(
        child: Text(
          context.loc.thereAreNoScheduledDetections,
          style: context.typography.textmdMedium.copyWith(
            color: context.colors.gray500,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: detections.length,
      itemBuilder: (context, dayIndex) {
        final day = detections[dayIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                day.date.formatDateShortly,
                style: context.typography.textsmRegular.copyWith(
                  color: context.colors.gray500,
                ),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: day.detections.length,
              itemBuilder: (context, subjectIndex) {
                final subject = day.detections[subjectIndex];
                return ScheduleSubjectTile(
                  onTap: () {
                    showSheetPopup(
                      title: Text(
                        context.loc.plannedDetection,
                        style: context.typography.textlgSemibold.copyWith(
                          color: context.colors.black,
                        ),
                      ),
                      context,
                      builder: (context) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: context.colors.turnOffButtonColor,
                                      foregroundColor: context.colors.buttonColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      shadowColor: const Color(0x0D0A0D12),
                                      elevation: 2,
                                    ),
                                    onPressed: () => (BuildContext context) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CustomAlertDialog(
                                            backgorundColor: context.colors.error50,
                                            iconColor: context.colors.error500,
                                            title: context.loc.doYouWantToDeleteAScheduledDetection,
                                            subtitle: context.loc.youWontBeAbleToRestartItAgain,
                                          );
                                        },
                                      );
                                    }(context),
                                    child: Text(
                                      context.loc.deleteFromTheList,
                                      style: context.typography.textsmSemibold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ScheduleSubjectTile(
                              subjectName: subject.subjectName,
                              className: subject.classEntity.className,
                              startTime: subject.startTime,
                              endTime: subject.endTime,
                              room: subject.room ?? subject.purpose ?? context.loc.examination,
                              onTap: () {},
                            ),
                            const SizedBox(height: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.loc.detail,
                                  style: context.typography.textsmMedium.copyWith(
                                    color: context.colors.gray700,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Container(
                                  decoration: BoxDecoration(
                                    color: context.colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: context.colors.gray300,
                                    ),
                                  ),
                                  child: TextField(
                                    cursorColor: context.colors.black.withOpacity(0.5),
                                    cursorRadius: const Radius.circular(8),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: context.loc.addComments,
                                      hintStyle:
                                          context.typography.textmdRegular.copyWith(color: context.colors.gray500),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: Text(
                                  context.loc.save,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  subjectName: subject.subjectName,
                  className: subject.classEntity.className,
                  startTime: subject.startTime,
                  endTime: subject.endTime,
                  room: subject.purpose != null ? '${subject.purpose}' : '',
                );
              },
            ),
          ],
        );
      },
    );
  }

  String _getStatusText(BuildContext context, DetectionEntity subject) {
    final processingCount = subject.processingCount ?? 0;
    final status = subject.status;

    String text;
    switch (status) {
      case 'done':
        text = 'Обработано';
        break;
      case 'in process':
        String eventNoun;
        int lastDigit = processingCount % 10;
        int lastTwoDigits = processingCount % 100;

        if (lastDigit == 1 && lastTwoDigits != 11) {
          eventNoun = "событие";
        } else if ((lastDigit >= 2 && lastDigit <= 4) && !(lastTwoDigits >= 12 && lastTwoDigits <= 14)) {
          eventNoun = "события";
        } else {
          eventNoun = "событий";
        }

        text = 'В обработке $processingCount $eventNoun';
        break;
      default:
        text = 'В обработке';
    }

    return text;
  }

  Widget _buildHistoryTab(BuildContext context, List<DetectionDateEntity> historyDetections) {
    if (historyDetections.isEmpty) {
      return Center(
        child: Text(
          context.loc.detectionHistoryIsEmpty,
          style: context.typography.textmdMedium.copyWith(
            color: context.colors.gray500,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: historyDetections.length,
      itemBuilder: (context, dayIndex) {
        final day = historyDetections[dayIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                day.date.formatDateShortly,
                style: context.typography.textsmRegular.copyWith(
                  color: context.colors.gray500,
                ),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: day.detections.length,
              itemBuilder: (context, subjectIndex) {
                final subject = day.detections[subjectIndex];
                return ScheduleSubjectTile(
                  status: subject.status,
                  onTap: () => context.push(RoutePaths.detectionPreProcessing, extra: subject),
                  subjectName: subject.subjectName,
                  className: subject.classEntity.className,
                  startTime: subject.startTime,
                  endTime: subject.endTime,
                  room: subject.room != null ? '${subject.room}' : '',
                  statusText: _getStatusText(context, subject),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return TabBar(
      unselectedLabelStyle: context.typography.textmdMedium.copyWith(
        color: context.colors.gray500,
      ),
      labelStyle: context.typography.textmdSemibold.copyWith(
        color: context.colors.black,
      ),
      tabAlignment: TabAlignment.fill,
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      controller: _tabController,
      tabs: [
        Tab(text: context.loc.planned),
        Tab(text: context.loc.history),
      ],
    );
  }
}
