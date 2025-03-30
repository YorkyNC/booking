import 'package:flutter/material.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';

class ConflictStatusDate extends StatelessWidget {
  const ConflictStatusDate({
    super.key,
    required this.event,
    this.headerStyle,
    this.dateStyle,
    this.gap,
  });

  final EventEntity event;
  final TextStyle? headerStyle;
  final TextStyle? dateStyle;
  final double? gap;

  Widget _getExpirationText(BuildContext context) {
    final textStyle = dateStyle ?? context.typography.typography1Medium;
    if (event.assignedTo?.isMe == false) {
      return const SizedBox();
    }
    final completedAt = event.completedAt;
    if (completedAt != null) {
      return Text(
        completedAt.formatDateTime,
        style: textStyle.copyWith(
          color: context.colors.success500,
        ),
      );
    }
    final timeLeft = event.expiresAt.difference(DateTime.now());
    switch (timeLeft.inSeconds) {
      case > 21600:
        return Text(
          context.loc.hours(timeLeft.inHours),
          style: textStyle.copyWith(
            color: context.colors.blue500,
          ),
        );
      case > 3600:
        return Text(
          context.loc.hours(timeLeft.inHours),
          style: textStyle.copyWith(
            color: context.colors.warning500,
          ),
        );
      case > 0:
        return Text(
          context.loc.minutes(timeLeft.inMinutes),
          style: textStyle.copyWith(
            color: context.colors.error500,
          ),
        );
      default:
        return Text(
          event.expiresAt.formatDateTime,
          style: textStyle.copyWith(
            color: context.colors.black,
          ),
        );
    }
  }

  Widget _getExpirationHeaderText(BuildContext context) {
    final textStyle = headerStyle ?? context.typography.textxsMedium;
    if (event.assignedTo?.isMe == false) {
      return const SizedBox();
    }
    if (event.completedAt != null) {
      return Text(
        context.loc.processed,
        style: textStyle.copyWith(
          color: context.colors.success500,
        ),
      );
    }
    if (event.expiresAt.isBefore(DateTime.now())) {
      return Text(
        context.loc.timeOut,
        style: textStyle.copyWith(
          color: context.colors.black,
        ),
      );
    }
    return Text(
      context.loc.left,
      style: textStyle.copyWith(
        color: context.colors.gray500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _getExpirationHeaderText(context),
        SizedBox(height: gap),
        _getExpirationText(context),
      ],
    );
  }
}
