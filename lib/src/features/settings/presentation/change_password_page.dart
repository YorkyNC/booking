import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool _hasMinLength = false;
  bool _hasUpperAndLowerCase = false;
  bool _hasDigit = false;
  bool _passwordsMatch = true;

  bool _isLoading = false;
  bool _isSuccess = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateNewPassword(String value) {
    setState(() {
      _hasMinLength = value.length >= 8;
      _hasUpperAndLowerCase = value.contains(RegExp(r'[A-Z]')) && value.contains(RegExp(r'[a-z]'));
      _hasDigit = value.contains(RegExp(r'[0-9]'));

      // Also validate confirm password if it's not empty
      if (_confirmPasswordController.text.isNotEmpty) {
        _passwordsMatch = _confirmPasswordController.text == value;
      }
    });
  }

  void _validateConfirmPassword(String value) {
    setState(() {
      _passwordsMatch = value == _newPasswordController.text;
    });
  }

  Future<void> _changePassword() async {
    if (!_hasMinLength || !_hasUpperAndLowerCase || !_hasDigit || !_passwordsMatch) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // For demo purposes, always succeed
    setState(() {
      _isLoading = false;
      _isSuccess = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool canSubmit = _hasMinLength &&
        _hasUpperAndLowerCase &&
        _hasDigit &&
        _passwordsMatch &&
        _currentPasswordController.text.isNotEmpty &&
        _newPasswordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: context.colors.gray100,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          color: context.colors.white,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  SwitchableIconButton(
                    onTap: () => Navigator.of(context).pop(),
                    icon: context.icons.chevron_left,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Сменить пароль',
                    style: context.typography.textlgSemibold.copyWith(
                      color: context.colors.gray800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: _isSuccess
          ? _buildSuccessScreen(context)
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Обновить пароль',
                              style: context.typography.textmdSemibold.copyWith(
                                color: context.colors.black,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Нынешний пароль',
                              style: context.typography.textsmMedium.copyWith(
                                color: context.colors.gray700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Current Password
                            TextField(
                              obscuringCharacter: "*",
                              controller: _currentPasswordController,
                              obscureText: !_isCurrentPasswordVisible,
                              style: context.typography.textmdRegular.copyWith(
                                color: context.colors.gray900,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Введите текущий пароль',
                                hintStyle: context.typography.textmdRegular.copyWith(
                                  color: context.colors.gray500,
                                ),
                                labelStyle: context.typography.textmdRegular.copyWith(color: context.colors.gray700),
                                filled: true,
                                fillColor: context.colors.white,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                  borderSide: BorderSide(color: context.colors.brand500),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isCurrentPasswordVisible
                                        ? context.icons.visible__eye_eyeball_open_view
                                        : context.icons.invisible_2,
                                    color: context.colors.gray500,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Новый пароль',
                              style: context.typography.textsmMedium.copyWith(
                                color: context.colors.gray700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // New Password
                            TextField(
                              obscuringCharacter: '*',
                              controller: _newPasswordController,
                              obscureText: !_isNewPasswordVisible,
                              style: context.typography.textmdRegular.copyWith(
                                color: context.colors.gray900,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Введите новый пароль',
                                hintStyle: context.typography.textmdRegular.copyWith(
                                  color: context.colors.gray500,
                                ),
                                filled: true,
                                fillColor: context.colors.white,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                  borderSide: BorderSide(color: context.colors.brand500),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isNewPasswordVisible
                                        ? context.icons.visible__eye_eyeball_open_view
                                        : context.icons.invisible_2,
                                    color: context.colors.gray500,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isNewPasswordVisible = !_isNewPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                              onChanged: _validateNewPassword,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Повторите новый пароль',
                              style: context.typography.textsmMedium.copyWith(
                                color: context.colors.gray700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Confirm Password
                            TextField(
                              obscuringCharacter: '*',
                              controller: _confirmPasswordController,
                              obscureText: !_isConfirmPasswordVisible,
                              style: context.typography.textmdRegular.copyWith(
                                color: context.colors.gray900,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Повторите новый пароль',
                                hintStyle: context.typography.textmdRegular.copyWith(
                                  color: context.colors.gray500,
                                ),
                                filled: true,
                                fillColor: context.colors.white,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: context.colors.gray300),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: _confirmPasswordController.text.isNotEmpty && !_passwordsMatch
                                        ? context.colors.error500
                                        : context.colors.gray300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: _confirmPasswordController.text.isNotEmpty && !_passwordsMatch
                                        ? context.colors.error500.withValues(alpha: .5)
                                        : context.colors.brand500,
                                    width: _confirmPasswordController.text.isNotEmpty && !_passwordsMatch ? 4 : 1,
                                  ),
                                ),
                                suffixIcon: _confirmPasswordController.text.isNotEmpty && !_passwordsMatch
                                    ? Icon(
                                        Icons.error,
                                        color: context.colors.error500,
                                      )
                                    : IconButton(
                                        icon: Icon(
                                          _isConfirmPasswordVisible
                                              ? context.icons.visible__eye_eyeball_open_view
                                              : context.icons.invisible_2,
                                          color: context.colors.gray500,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                          });
                                        },
                                      ),
                              ),
                              onChanged: _validateConfirmPassword,
                            ),
                            if (_confirmPasswordController.text.isNotEmpty && !_passwordsMatch)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  'Пароли не совпадают',
                                  style: context.typography.textsmRegular.copyWith(
                                    color: context.colors.error500,
                                  ),
                                ),
                              ),
                            const SizedBox(height: 24),
                            // Password requirements
                            _buildPasswordRequirement(context, 'Не менее 8 символов',
                                _newPasswordController.text.isNotEmpty && _hasMinLength),
                            const SizedBox(height: 8),
                            _buildPasswordRequirement(context, 'Заглавные и строчные буквы',
                                _newPasswordController.text.isNotEmpty && _hasUpperAndLowerCase),
                            const SizedBox(height: 8),
                            _buildPasswordRequirement(
                                context, 'Не менее одной цифры', _newPasswordController.text.isNotEmpty && _hasDigit),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          width: double.infinity,
                          // height: 48,
                          child: ElevatedButton(
                            onPressed: canSubmit && !_isLoading ? _changePassword : null,
                            // style: ElevatedButton.styleFrom(
                            //   backgroundColor: context.colors.brand400,
                            //   disabledBackgroundColor: context.colors.gray300,
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(8),
                            //   ),
                            // ),
                            child: _isLoading
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(context.colors.white),
                                    ),
                                  )
                                : const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Сменить',
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildSuccessScreen(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
              bottom: Radius.circular(12),
            ),
            color: context.colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(context.assetImages.doneCheck),
                        const SizedBox(height: 24),
                        Text(
                          'Вы успешно сменили пароль',
                          style: context.typography.textxlBold.copyWith(
                            color: context.colors.brand400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.success500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Назад',
                      style: context.typography.textsmSemibold.copyWith(
                        color: context.colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordRequirement(BuildContext context, String text, bool isMet) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isMet ? context.colors.success500 : context.colors.gray200,
          ),
          child: Icon(
            Icons.check,
            size: 14,
            color: context.colors.white,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: context.typography.textsmRegular.copyWith(
            color: isMet ? context.colors.success500 : context.colors.gray700,
          ),
        ),
      ],
    );
  }
}
