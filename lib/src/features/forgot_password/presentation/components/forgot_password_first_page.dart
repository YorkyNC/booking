import 'package:booking/src/core/extensions/build_context_extension.dart';

import '../../../../app/imports.dart';
import '../../../login/presentation/components/email_text_form_field.dart';

class ForgotPasswordFirstPage extends StatefulWidget {
  const ForgotPasswordFirstPage({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.pageController,
    required this.callback,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final PageController pageController;
  final VoidCallback callback;

  @override
  State<ForgotPasswordFirstPage> createState() => _ForgotPasswordFirstPageState();
}

class _ForgotPasswordFirstPageState extends State<ForgotPasswordFirstPage> {
  bool _isValid = false;

  @override
  void dispose() {
    super.dispose();
    widget.emailController.removeListener(_validate);
  }

  @override
  void initState() {
    super.initState();
    widget.emailController.addListener(_validate);
  }

  void _validate() {
    final emilValid = widget.emailController.text.isNotEmpty;

    if (_isValid != emilValid) {
      setState(() {
        _isValid = emilValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Form(
            key: widget.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot password?',
                  style: context.typography.textxlBold.copyWith(
                    color: context.colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Please enter your email and we will send an OTP code in the next step to reset your password.',
                  style: context.typography.textmdRegular.copyWith(
                    color: context.colors.gray500,
                  ),
                ),
                const SizedBox(height: 20),
                EmailTextFormField(
                  emailController: widget.emailController,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: _isValid
                              ? () {
                                  widget.callback();
                                }
                              : null,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Получить код'),
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
