import 'dart:async';

import 'package:intl/intl.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class ScheduleSubjectTile extends StatefulWidget {
  final String subjectName;
  final String className;
  final DateTime startTime;
  final DateTime endTime;
  final String room;
  final String? puspose;
  final String? status;
  final String? statusText;
  final VoidCallback onTap;
  final bool? showCurrentSubject;

  const ScheduleSubjectTile({
    super.key,
    required this.subjectName,
    required this.className,
    required this.startTime,
    required this.endTime,
    required this.room,
    this.puspose,
    this.showCurrentSubject = false,
    required this.onTap,
    this.status,
    this.statusText,
  });

  @override
  State<ScheduleSubjectTile> createState() => _ScheduleSubjectTileState();
}

class _ScheduleSubjectTileState extends State<ScheduleSubjectTile> {
  late Timer _timer;
  late bool isCurrentTimeInRange;
  late bool isPastSubject;
  Color _getStatusColor(BuildContext context, String status) {
    Color color;
    switch (status) {
      case 'done':
        color = context.colors.success500;
        break;
      case 'in process':
        color = context.colors.warning500;
        break;
      default:
        color = context.colors.error500;
        break;
    }
    return color;
  }

  @override
  void initState() {
    super.initState();
    _updateTimeStatus();
    // Update every minute
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      _updateTimeStatus();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTimeStatus() {
    final currentTime = DateTime.now();
    setState(() {
      isCurrentTimeInRange = currentTime.isAfter(widget.startTime) && currentTime.isBefore(widget.endTime);
      isPastSubject = widget.showCurrentSubject! && currentTime.isAfter(widget.endTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('HH:mm');

    return Container(
      decoration: widget.showCurrentSubject! && isCurrentTimeInRange
          ? BoxDecoration(
              color: context.colors.indigo50,
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      child: ListTile(
        onTap: widget.onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        trailing: widget.status != null
            ? Text(
                widget.statusText!,
                style: context.typography.textxsRegular.copyWith(
                  color: _getStatusColor(context, widget.status!),
                ),
              )
            : Text(
                widget.puspose ?? widget.room ?? '',
                style: context.typography.textxsRegular.copyWith(
                  color: context.colors.gray500,
                ),
              ),
        title: Text(
          widget.subjectName,
          style: context.typography.textsmSemibold.copyWith(
            color: isPastSubject ? context.colors.gray500 : context.colors.black,
          ),
        ),
        subtitle: Text(
          widget.className,
          style: context.typography.textxsRegular.copyWith(
            color: context.colors.gray500,
          ),
        ),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 40,
              height: 48,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    timeFormat.format(widget.startTime),
                    style: context.typography.textsmMedium.copyWith(
                      color: isPastSubject ? context.colors.gray500 : context.colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    timeFormat.format(widget.endTime),
                    style: context.typography.textsmRegular.copyWith(
                      color: context.colors.gray500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            VerticalDivider(
              color: context.colors.gray300,
            )
          ],
        ),
      ),
    );
  }
}
