import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/student/presentation/components/student_contact_tile.dart';
import 'package:booking/src/features/student/presentation/components/student_dossier_app_bar.dart';

class StudentDossierPage extends StatelessWidget {
  final String firstName;
  final String secondName;
  const StudentDossierPage({
    super.key,
    required this.firstName,
    required this.secondName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray100,
      appBar: StudentDossierAppBar(
        firstName: firstName,
        secondName: secondName,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              color: context.colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/app_images/example.png',
                      width: double.infinity,
                      height: 343,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Светлана С.',
                        style: context.typography.textlgSemibold.copyWith(
                          color: context.colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '6Б класс',
                        style: context.typography.typography2Medium.copyWith(
                          color: context.colors.gray500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Опекуны',
                        style: context.typography.textmdMedium.copyWith(
                          color: context.colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const StudentContactTile(
                        imagePath: 'assets/app_images/example.png',
                        firstName: 'Айдана',
                        secondName: 'Кайсар',
                        email: 'aidana-k@gmail.com',
                      ),
                      const Divider(),
                      Text(
                        'Классный руководитель',
                        style: context.typography.textmdMedium.copyWith(
                          color: context.colors.black,
                        ),
                      ),
                      const StudentContactTile(
                        imagePath: 'assets/app_images/example.png',
                        firstName: 'Кайрат',
                        secondName: 'Парасат',
                        email: 'kairat.p@gmail.com',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
