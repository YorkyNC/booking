import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[ -~]')),
      ],
      controller: emailController,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Пожалуйста, введите email';
      //   }
      //   final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      //   if (!emailRegex.hasMatch(value)) {
      //     return 'Пожалуйста, введите корректный email';
      //   }
      //   return null;
      // },
      cursorHeight: 24,
      style: context.typography.textmdRegular.copyWith(
        color: context.colors.gray700,
      ),
      cursorColor: context.colors.brand500,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: context.typography.textmdRegular.copyWith(
          color: context.colors.gray500,
        ),
        errorStyle: context.typography.textsmRegular.copyWith(
          color: context.colors.error500,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
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
    );
  }
}
