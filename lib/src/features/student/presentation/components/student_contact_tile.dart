import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class StudentContactTile extends StatelessWidget {
  final String imagePath;
  final String firstName;
  final String secondName;
  final String email;
  const StudentContactTile({
    super.key,
    required this.imagePath,
    required this.firstName,
    required this.secondName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          width: 40,
          height: 40,
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        '$firstName ${secondName[0]}.',
        style: context.typography.textmdMedium.copyWith(
          color: context.colors.black,
        ),
      ),
      subtitle: Text(
        email,
        style: context.typography.textsmRegular.copyWith(
          color: context.colors.gray500,
        ),
      ),
    );
  }
}
