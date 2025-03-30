import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class DetectionSubjectTile extends StatelessWidget {
  const DetectionSubjectTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      secondary: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 50,
            height: 58,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '14:10',
                  style: context.typography.textsmMedium.copyWith(
                    color: context.colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '14:50',
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      selected: true,
      selectedTileColor: context.colors.indigo50,
      checkColor: context.colors.white,
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Алгебра 1",
            style: context.typography.textsmSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '7А класс',
            style: context.typography.textxsRegular.copyWith(
              color: context.colors.gray500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'каб. 25',
            style: context.typography.textxsRegular.copyWith(
              color: context.colors.gray500,
            ),
          ),
        ],
      ),
      value: true,
      onChanged: (bool? value) {},
    );
  }
}
