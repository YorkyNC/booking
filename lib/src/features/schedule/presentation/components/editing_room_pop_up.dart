import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class EditingRoomPopUp extends StatelessWidget {
  const EditingRoomPopUp({
    super.key,
    required this.subjectName,
    required this.className,
    required this.room,
  });

  final String subjectName;
  final String className;
  final String room;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Сменить кабинет',
          style: context.typography.textsmSemibold.copyWith(
            color: context.colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Text(
                subjectName,
                style: context.typography.textmdMedium.copyWith(
                  color: context.colors.black,
                ),
              ),
            ),
            Text(
              className,
              style: context.typography.textxsRegular.copyWith(
                color: context.colors.gray500,
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'В каком кабинете будет проходить урок',
          style: context.typography.textsmMedium.copyWith(
            color: context.colors.gray700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: context.colors.gray300,
            ),
          ),
          child: TextField(
            cursorColor: context.colors.black.withValues(alpha: 0.5),
            cursorRadius: const Radius.circular(8),
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: room,
              hintStyle: context.typography.textmdRegular.copyWith(color: context.colors.gray500),
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              context.loc.save,
            ),
          ),
        )
      ],
    );
  }
}
