import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class ClassListTile extends StatelessWidget {
  final String className;
  final String studentCount;
  final VoidCallback onTap;
  const ClassListTile({
    super.key,
    required this.className,
    required this.studentCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        className,
        style: context.typography.textmdMedium.copyWith(
          color: context.colors.black,
        ),
      ),
      subtitle: Text(
        '$studentCount учеников',
        style: context.typography.textsmMedium.copyWith(
          color: context.colors.gray500,
        ),
      ),
      trailing: Icon(
        context.icons.chevron_right,
        size: 24,
        color: context.colors.gray500,
      ),
    );
  }
}
