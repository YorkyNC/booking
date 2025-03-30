import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class StudentValidationButtons extends StatelessWidget {
  const StudentValidationButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: context.colors.white,
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  context.icons.check__check_form_validation_checkmark_success_add_addition_tick,
                  size: 20,
                  color: context.colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  context.loc.yes,
                  style: context.typography.textmdSemibold,
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        customValidationButton(context, context.colors.gray700, const Color(0xfffd5d7da), 'Не знаю',
            context.icons.help_question_1__circle_faq_frame_help_info_mark_more_query_question),
        const SizedBox(width: 12),
        customValidationButton(context, context.colors.error700, context.colors.deleteButtonBorderColor, 'No',
            context.icons.delete_1__remove_add_button_buttons_delete_cross_x_mathematics_multiply_math)
      ],
    );
  }

  Expanded customValidationButton(
      BuildContext context, Color foregroundColor, Color borderColor, String title, IconData icon) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor,
          side: BorderSide(
            color: borderColor,
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: foregroundColor,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: context.typography.textmdSemibold,
            )
          ],
        ),
      ),
    );
  }
}
