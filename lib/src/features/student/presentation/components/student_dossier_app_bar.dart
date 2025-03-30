import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';

class StudentDossierAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String firstName;
  final String secondName;
  const StudentDossierAppBar({
    super.key,
    required this.firstName,
    required this.secondName,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.gray100,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            children: [
              SwitchableIconButton(
                onTap: () => context.pop(),
                icon: context.icons.chevron_left,
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$firstName ${secondName[0]}.',
                    style: context.typography.textxlBold.copyWith(
                      color: context.colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.loc.studentDossier,
                    style: context.typography.textsmMedium.copyWith(
                      color: context.colors.gray500,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
