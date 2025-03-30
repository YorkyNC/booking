import 'package:flutter_svg/svg.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class ParentAttendanceStatus extends StatelessWidget {
  final bool isInSchool;
  final VoidCallback onTap;

  const ParentAttendanceStatus({
    super.key,
    required this.isInSchool,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            spacing: 16,
            children: [
              Container(
                width: context.width * 0.3,
                height: context.width * 0.3,
                decoration: BoxDecoration(
                  color: context.colors.brand25,
                  borderRadius: BorderRadius.circular(8),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: isInSchool
                        ? SvgPicture.asset(
                            context.assetImages.inSchool,
                            width: context.width * 0.2,
                            height: context.width * 0.2,
                            fit: BoxFit.contain,
                          )
                        : SvgPicture.asset(
                            context.assetImages.notInSchool,
                            width: context.width * 0.2,
                            height: context.width * 0.2,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
              ),
              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isInSchool ? context.loc.inSchool : context.loc.notInSchool,
                    style: context.typography.displayxsBold.copyWith(
                      color: isInSchool ? context.colors.brand400 : context.colors.gray400,
                    ),
                  ),
                  Text(
                    isInSchool ? context.loc.enteredSchool : context.loc.leftSchool,
                    style: context.typography.textsmMedium.copyWith(
                      color: context.colors.gray500,
                    ),
                  ),
                  Text(
                    isInSchool ? '10:00' : '--:--',
                    style: context.typography.textxlSemibold.copyWith(
                      color: context.colors.black,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: onTap,
                child: SizedBox(
                  width: context.width * 0.1,
                  height: context.width * 0.1,
                  child: Icon(
                    context.icons.chevron_right,
                    color: context.colors.gray600,
                    size: 24,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
