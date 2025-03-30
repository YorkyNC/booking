import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class CustomSnackBar {
  static SnackBar show({required String title, required int seconds, required BuildContext context}) {
    return SnackBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      backgroundColor: context.colors.gray200,
      duration: Duration(seconds: seconds),
      content: Text(
        title,
        style: context.typography.textmdSemibold.copyWith(
          color: context.colors.black,
        ),
      ),
    );
  }
}
