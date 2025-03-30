import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

import '../../core/theme/typography.dart';
import '../../core/widgets/toggle_bar/custom_toggle_bar.dart';

class NotificationSheetWidget extends StatefulWidget {
  final String title;
  const NotificationSheetWidget({super.key, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationSheetWidgetState createState() => _NotificationSheetWidgetState();
}

class _NotificationSheetWidgetState extends State<NotificationSheetWidget> {
  bool isClassToggled = true;
  bool isSchoolToggled = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(9.54)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: const FigmaTextStyles().typography4Medium.copyWith(
                      color: context.colors.black,
                    ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.loc.yourClass,
                    style: const FigmaTextStyles().typography3Medium.copyWith(
                          color: context.colors.black,
                        ),
                  ),
                  CustomSwitch(
                    value: isClassToggled,
                    activeColor: const Color(0xFF33C5AB),
                    onToggle: (value) {
                      setState(() {
                        isClassToggled = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.loc.school,
                    style: const FigmaTextStyles().typography3Medium.copyWith(
                          color: context.colors.black,
                        ),
                  ),
                  CustomSwitch(
                    value: isSchoolToggled,
                    activeColor: const Color(0xFF33C5AB),
                    onToggle: (value) {
                      setState(() {
                        isSchoolToggled = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                context.loc.notificationsImportantEventsWillArriveAnyway,
                style: const FigmaTextStyles().typography2Regular.copyWith(
                      color: context.colors.black,
                    ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
