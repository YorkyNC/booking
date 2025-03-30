import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class CheatingDetectionImageCard extends StatelessWidget {
  const CheatingDetectionImageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Подглядывание',
                      style: context.typography.textmdSemibold.copyWith(
                        color: context.colors.black,
                      ),
                    ),
                    Text(
                      '8:12',
                      style: context.typography.textsmRegular.copyWith(
                        color: context.colors.gray500,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              'assets/app_images/example2.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: context.colors.gray700,
            textStyle: context.typography.textsmSemibold,
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Это ошибка',
              ),
              const SizedBox(width: 8),
              Icon(
                context.icons.delete_1__remove_add_button_buttons_delete_cross_x_mathematics_multiply_math,
                size: 20,
                color: context.colors.gray700,
              )
            ],
          ),
        ),
      ],
    );
  }
}
