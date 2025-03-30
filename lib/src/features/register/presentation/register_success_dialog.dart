import 'dart:async';

import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class RegisterSuccessDialog extends StatefulWidget {
  final VoidCallback onRedirect;

  const RegisterSuccessDialog({
    Key? key,
    required this.onRedirect,
  }) : super(key: key);

  static Future<void> show(BuildContext context, {required VoidCallback onRedirect}) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return RegisterSuccessDialog(onRedirect: onRedirect);
      },
    );
  }

  @override
  State<RegisterSuccessDialog> createState() => _RegisterSuccessDialogState();
}

class _RegisterSuccessDialogState extends State<RegisterSuccessDialog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        Timer(const Duration(seconds: 2), () {
          if (mounted) {
            widget.onRedirect();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Simply use the provided image
          Image.asset('assets/app_images/image.png'),
          const SizedBox(height: 24),
          Text(
            "Registration Success",
            style: context.typography.textxlSemibold.copyWith(
              color: context.colors.gray900,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Please wait.",
            style: context.typography.textmdRegular.copyWith(
              color: context.colors.gray600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "You will be directed to the homepage",
            style: context.typography.textmdRegular.copyWith(
              color: context.colors.gray600,
            ),
          ),
          const SizedBox(height: 24),
          _isLoading
              ? AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        value: null,
                        strokeWidth: 3,
                        color: context.colors.purple500,
                      ),
                    );
                  },
                )
              : const SizedBox(height: 40),
        ],
      ),
    );
  }
}
