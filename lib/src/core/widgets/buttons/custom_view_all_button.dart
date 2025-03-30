import 'package:booking/src/app/imports.dart';

class CustomViewAllButton extends StatelessWidget {
  final String title;
  final Color color;
  final TextStyle style;
  final VoidCallback onTap;

  const CustomViewAllButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.color,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Center(
          child: Text(title,
              style: style.copyWith(
                color: color,
              )),
        ),
      ),
    );
  }
}
