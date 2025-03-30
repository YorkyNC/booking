import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/base/base_bloc/bloc/base_bloc_widget.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/services/storage/storage_service_impl.dart';
import 'package:booking/src/core/utils/loggers/logger.dart';
import 'package:booking/src/features/login/presentation/bloc/auth_bloc.dart';
import 'package:booking/src/features/login/presentation/components/email_text_form_field.dart';
import 'package:booking/src/features/login/presentation/components/login_app_bar.dart';
import 'package:booking/src/features/login/presentation/components/password_text_form_field.dart';
import 'package:booking/src/features/login/presentation/custom_snack_bar.dart';
import 'package:booking/src/features/register/presentation/register_success_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/services/injectable/injectable_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  StorageServiceImpl storageService = StorageServiceImpl();

  AuthBloc authBloc = getIt<AuthBloc>();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool _formIsValid = false;

  String _passwordErrorText = 'Please enter a password';
  String _confirmPasswordErrorText = 'Please confirm your password';

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.removeListener(_validateForm);
    _passwordController.removeListener(_validateForm);
    _nameController.removeListener(_validateForm);
    _confirmPasswordController.removeListener(_validateForm);

    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
    _nameController.addListener(_validateForm);
    _confirmPasswordController.addListener(_validateForm);
  }

  void _validateForm() {
    final nameValid = _nameController.text.isNotEmpty;
    final emailValid = _emailController.text.isNotEmpty;
    final passwordValid = _passwordController.text.isNotEmpty;
    final confirmPasswordValid = _confirmPasswordController.text.isNotEmpty;
    final passwordsMatch = _passwordController.text == _confirmPasswordController.text;

    // Only update state if the validity changed
    if (_formIsValid != (nameValid && emailValid && passwordValid && confirmPasswordValid && passwordsMatch)) {
      setState(() {
        _formIsValid = nameValid && emailValid && passwordValid && confirmPasswordValid && passwordsMatch;
      });
    }
  }

  void _redirectToHome(String token, String refreshToken) {
    storageService.setToken(token);
    storageService.setRefreshToken(refreshToken);

    Log.e(token);
    Log.e(storageService.getRefreshToken()!);
    RegisterSuccessDialog.show(
      context,
      onRedirect: () {
        Navigator.of(context).pop();
        context.pushReplacement(RoutePaths.studentMain);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocWidget<AuthBloc, AuthEvent, AuthState>(
      bloc: authBloc,
      listenWhen: (previous, current) {
        return current.maybeMap(
          error: (_) => true,
          loaded: (_) => true,
          orElse: () => false,
        );
      },
      listener: (context, state) {
        state.whenOrNull(
          error: (error) {
            _passwordController.clear();
            _confirmPasswordController.clear();
            _formKey.currentState!.validate();
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.show(title: error, seconds: 3, context: context),
            );
          },
          loaded: (viewModel) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            _redirectToHome(viewModel.token, viewModel.refreshToken);
          },
        );
      },
      builder: (context, state, bloc) {
        return Scaffold(
          appBar: const LoginAppBar(
            title: 'Register as student',
          ),
          backgroundColor: context.colors.gray100,
          body: SingleChildScrollView(
            child: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: context.colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Spacer(),
                            Image.asset('assets/app_images/dark.png'),
                            const Spacer(),
                            Image.asset('assets/app_images/star2.png'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Name field
                        TextFormField(
                          keyboardType: TextInputType.name,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[ -~]')),
                          ],
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          cursorHeight: 24,
                          style: context.typography.textmdRegular.copyWith(
                            color: context.colors.gray700,
                          ),
                          cursorColor: context.colors.brand500,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: context.typography.textmdRegular.copyWith(
                              color: context.colors.gray500,
                            ),
                            errorStyle: context.typography.textsmRegular.copyWith(
                              color: context.colors.error500,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: context.colors.gray300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: context.colors.gray300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: context.colors.buttonColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: context.colors.error300),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        // Email field
                        EmailTextFormField(
                          emailController: _emailController,
                        ),
                        const SizedBox(height: 18),
                        // Password field
                        PasswordTextFormField(
                          passwordController: _passwordController,
                          isPasswordVisible: _isPasswordVisible,
                          errorText: _passwordErrorText,
                          onPasswordVisibilityChanged: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        const SizedBox(height: 18),
                        // Confirm Password field
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return _confirmPasswordErrorText;
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          cursorHeight: 24,
                          style: context.typography.textmdRegular.copyWith(
                            color: context.colors.gray700,
                          ),
                          obscureText: !_isConfirmPasswordVisible,
                          obscuringCharacter: '*',
                          cursorColor: context.colors.brand500,
                          decoration: InputDecoration(
                            errorStyle: context.typography.textsmRegular.copyWith(
                              color: context.colors.error500,
                            ),
                            labelText: 'Confirm Password',
                            labelStyle: context.typography.textmdRegular.copyWith(
                              color: context.colors.gray500,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: context.colors.gray300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: context.colors.gray300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: context.colors.buttonColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: context.colors.error300),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _isConfirmPasswordVisible
                                      ? context.icons.invisible_2
                                      : context.icons.visible__eye_eyeball_open_view,
                                  color: context.colors.gray500),
                              onPressed: () {
                                setState(() {
                                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        // Register button
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: context.colors.buttonColor,
                                    foregroundColor: context.colors.white,
                                    disabledBackgroundColor: context.colors.gray300,
                                    padding: const EdgeInsets.all(12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: _formIsValid
                                      ? () {
                                          if (_formKey.currentState!.validate()) {
                                            setState(() {
                                              _confirmPasswordErrorText = 'Passwords do not match';
                                            });

                                            String email = _emailController.text.trim();

                                            authBloc.add(
                                              AuthEvent.register(
                                                email: email,
                                                password: _passwordController.text,
                                                firstName: _nameController.text,
                                                lastName: '',
                                                username: email,
                                              ),
                                            );
                                            ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.show(
                                                title: 'Please wait...', seconds: 1, context: context));
                                          } else {
                                            setState(() {
                                              _passwordErrorText = 'Please enter a password';
                                              _confirmPasswordErrorText = 'Please confirm your password';
                                            });
                                          }
                                        }
                                      : null,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Register'),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(child: Divider()),
                            const SizedBox(width: 20),
                            Text(
                              'or',
                              style: context.typography.textmdMedium.copyWith(
                                color: context.colors.gray400,
                              ),
                            ),
                            const SizedBox(width: 20),
                            const Expanded(child: Divider()),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Social login button
                        Row(
                          children: [
                            Expanded(
                              child: Material(
                                color: Colors.transparent,
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: context.colors.card04Light,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () {
                                      print('tapped');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(context.assetImages.vector),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Continue with Apple',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'By continuing I agree with Privacy Policy and Terms & Conditions',
                          style: context.typography.textmdRegular.copyWith(
                            color: context.colors.gray400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
