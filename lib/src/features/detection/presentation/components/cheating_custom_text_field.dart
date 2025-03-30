import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class CheatingCustomTextField extends StatelessWidget {
  const CheatingCustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: context.typography.textmdRegular.copyWith(
        color: context.colors.gray500,
      ),
      decoration: InputDecoration(
        hintText: context.loc.notNecessarily,
        hintStyle: context.typography.textmdRegular.copyWith(
          color: context.colors.gray500,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xffD5D7DA),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xffD5D7DA),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xffD5D7DA),
          ),
        ),
      ),
    );
  }
}
