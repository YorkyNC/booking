// section_header.dart

import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class TimeRangePicker extends StatelessWidget {
  final BuildContext context;
  final List<String> startTimes;
  final List<String> endTimes;
  final String? selectedStartTime;
  final String? selectedEndTime;
  final Function(String?) onStartTimeChanged;
  final Function(String?) onEndTimeChanged;
  final String? Function(String?) validator;

  const TimeRangePicker({
    super.key,
    required this.context,
    required this.startTimes,
    required this.endTimes,
    required this.selectedStartTime,
    required this.selectedEndTime,
    required this.onStartTimeChanged,
    required this.onEndTimeChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colors.gray300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colors.gray300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colors.buttonColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colors.error300),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
            hint: Text(
              '12:00',
              style: context.typography.textmdMedium.copyWith(
                color: context.colors.gray500,
              ),
            ),
            value: selectedStartTime,
            items: startTimes
                .map((time) => DropdownMenuItem<String>(
                      value: time,
                      child: Text(
                        time,
                        style: context.typography.textmdMedium.copyWith(
                          color: context.colors.black,
                        ),
                      ),
                    ))
                .toList(),
            validator: validator,
            onChanged: onStartTimeChanged,
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            Icons.arrow_forward,
            color: context.colors.gray700,
            size: 20,
          ),
        ),
        Expanded(
          child: DropdownButtonFormField2<String>(
            isExpanded: true,
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
            hint: Text(
              '14:00',
              style: context.typography.textmdMedium.copyWith(
                color: context.colors.gray500,
              ),
            ),
            value: selectedEndTime,
            items: endTimes
                .where((time) {
                  if (selectedStartTime == null) return true;
                  final startIndex = startTimes.indexOf(selectedStartTime!);
                  final endIndex = endTimes.indexOf(time);
                  return endIndex > startIndex;
                })
                .map((time) => DropdownMenuItem<String>(
                      value: time,
                      child: Text(
                        time,
                        style: context.typography.textmdMedium.copyWith(
                          color: context.colors.black,
                        ),
                      ),
                    ))
                .toList(),
            validator: validator,
            onChanged: onEndTimeChanged,
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}
