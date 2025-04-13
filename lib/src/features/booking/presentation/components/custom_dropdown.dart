// section_header.dart

import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final BuildContext context;
  final List<Map<String, dynamic>> items;
  final String hintText;
  final String valueKey;
  final String displayKey;
  final String countKey;
  final String? value;
  final String? Function(String?)? validator;
  final void Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.context,
    required this.items,
    required this.hintText,
    required this.valueKey,
    required this.displayKey,
    required this.countKey,
    required this.value,
    required this.validator,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
      hint: Text(
        hintText,
        style: context.typography.textmdMedium.copyWith(
          color: context.colors.gray500,
        ),
      ),
      value: value,
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item[valueKey],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item[displayKey],
                      style: context.typography.textmdMedium.copyWith(
                        color: context.colors.black,
                      ),
                    ),
                    Text(
                      item[countKey].toString(),
                      style: context.typography.textmdMedium.copyWith(
                        color: context.colors.gray700,
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
      validator: validator,
      onChanged: onChanged,
      onSaved: onChanged,
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
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
