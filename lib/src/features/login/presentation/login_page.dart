import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/base/base_bloc/bloc/base_bloc_widget.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/services/storage/storage_service_impl.dart';
import 'package:booking/src/core/utils/loggers/logger.dart';
import 'package:booking/src/features/login/presentation/components/login_app_bar.dart';
import 'package:booking/src/features/login/presentation/components/password_text_form_field.dart';
import 'package:booking/src/features/login/presentation/custom_snack_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/services/injectable/injectable_service.dart';
import 'bloc/auth_bloc.dart';
import 'components/email_text_form_field.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({
    super.key,
    required this.title,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  StorageServiceImpl storageService = StorageServiceImpl();

  AuthBloc authBloc = getIt<AuthBloc>();

  bool _isPasswordVisible = false;

  bool _formIsValid = false;

  String _passwordErrorText = 'Пожалуйста, введите пароль';

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.removeListener(_validateForm);
    _passwordController.removeListener(_validateForm);

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    final emailValid = _emailController.text.isNotEmpty;
    final passwordValid = _passwordController.text.isNotEmpty;

    // Only update state if the validity changed
    if (_formIsValid != (emailValid && passwordValid)) {
      setState(() {
        _formIsValid = emailValid && passwordValid;
      });
    }
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
            _formKey.currentState!.validate();
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.show(title: error, seconds: 3, context: context),
            );
          },
          loaded: (viewModel) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.show(title: 'Успешно вошли в систему', seconds: 3, context: context),
            );

            storageService.setToken(viewModel.token);
            storageService.setRefreshToken(viewModel.refreshToken);

            Log.e(viewModel.token);
            Log.e(storageService.getRefreshToken()!);

            context.pushReplacement(RoutePaths.studentMain);
          },
        );
      },
      builder: (context, state, bloc) {
        return Scaffold(
          appBar: LoginAppBar(
            title: widget.title,
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
                        const SizedBox(height: 6),
                        EmailTextFormField(
                          emailController: _emailController,
                        ),
                        const SizedBox(height: 12),
                        const SizedBox(height: 6),
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
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              context.pushNamed(RouteNames.forgotPassword);
                            },
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Don’t have an account?',
                                      style: context.typography.textmdMedium.copyWith(
                                        color: context.colors.gray400,
                                      )),
                                  const WidgetSpan(
                                      child: SizedBox(
                                    width: 4,
                                  )),
                                  TextSpan(
                                    text: 'Register',
                                    style: context.typography.textmdMedium.copyWith(
                                      color: context.colors.blue400,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.push(RoutePaths.forgotPassword);
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  // formKey: _formKey,
                                  onPressed: _formIsValid
                                      ? () {
                                          if (_formKey.currentState!.validate()) {
                                            setState(() {
                                              _passwordErrorText = 'Неверный логин или пароль';
                                            });
                                            authBloc.add(
                                              AuthEvent.login(
                                                username: _emailController.text,
                                                password: _passwordController.text,
                                              ),
                                            );
                                            ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.show(
                                                title: 'Пожалуйста, подождите...', seconds: 1, context: context));
                                          } else {
                                            setState(() {
                                              _passwordErrorText = 'Пожалуйста, введите пароль';
                                            });
                                          }
                                        }
                                      : null,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Continue'),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Forgot password',
                          style: context.typography.textmdMedium.copyWith(
                            color: context.colors.gray400,
                          ),
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
                        // const SizedBox(height: 16),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Material(
                        //         color: Colors.transparent,
                        //         child: Ink(
                        //           decoration: BoxDecoration(
                        //             color: context.colors.card04Light,
                        //             borderRadius: BorderRadius.circular(12),
                        //           ),
                        //           child: InkWell(
                        //             borderRadius: BorderRadius.circular(12),
                        //             onTap: () {
                        //               print('tapped');
                        //             },
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(14.0),
                        //               child: Row(
                        //                 mainAxisAlignment: MainAxisAlignment.center,
                        //                 children: [
                        //                   SvgPicture.asset(context.assetImages.vector),
                        //                   const SizedBox(width: 8),
                        //                   const Text(
                        //                     'Continue with Google',
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 40),
                        Text(
                          'By continuing I agree with Privacy Policyand Terms & Conditions',
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
