import 'dart:developer';

import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Controllers for form fields
  final TextEditingController _nameController = TextEditingController(text: 'Marbik');
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController(text: 'beimbet.m04@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: '12r"hdhhie83%v@_');

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text(
          context.loc.profile,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colors.gray300,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(35),
                  child: SvgPicture.asset(context.assetImages.profileUser),
                ),
              ),
              const SizedBox(height: 24),
              _buildLabel('Name'),
              const SizedBox(height: 12),
              _buildTextField(
                controller: _nameController,
                hintText: 'Your name',
                readOnly: false,
              ),
              const SizedBox(height: 16),
              _buildLabel('Surname (optional)'),
              const SizedBox(height: 12),
              _buildTextField(
                controller: _surnameController,
                hintText: 'Your surname',
                readOnly: false,
              ),
              const SizedBox(height: 16),
              _buildLabel('Email'),
              const SizedBox(height: 12),
              _buildTextField(
                controller: _emailController,
                hintText: 'Your email',
                readOnly: true,
              ),
              const SizedBox(height: 16),
              _buildLabel('Password'),
              const SizedBox(height: 12),
              _buildTextField(
                controller: _passwordController,
                hintText: 'Your password',
                isPassword: true,
                readOnly: true,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        _isPasswordVisible ? context.icons.invisible_2 : context.icons.visible__eye_eyeball_open_view,
                        color: context.colors.gray500,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        // _navigateToChangePassword();
                      },
                      child: Text(
                        'Change password',
                        style: context.typography.textsmMedium.copyWith(
                          color: context.colors.blue400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _logout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.error500,
                    foregroundColor: context.colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    context.loc.logOut,
                    style: context.typography.textmdMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: context.typography.textmdMedium.copyWith(
        color: context.colors.gray700,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
    bool readOnly = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[ -~]')),
      ],
      obscureText: isPassword && !_isPasswordVisible,
      controller: controller,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Пожалуйста, введите email';
      //   }
      //   final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      //   if (!emailRegex.hasMatch(value)) {
      //     return 'Пожалуйста, введите корректный email';
      //   }
      //   return null;
      // },
      readOnly: readOnly,
      cursorHeight: 24,
      style: context.typography.textmdRegular.copyWith(
        color: context.colors.gray700,
      ),
      cursorColor: context.colors.brand500,
      decoration: InputDecoration(
        // labelText: 'Email',
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
        suffixIcon: suffixIcon,
      ),
    );
  }

  void _logout() {
    _handleSignOut(context);
  }

  Future<void> _handleSignOut(BuildContext context) async {
    try {
      await st.clear();

      if (context.mounted) {
        context.go(RoutePaths.welcome);
      }
    } catch (e) {
      log('Error during sign out: $e', name: 'SignOutButton');
      await st.clear();
      if (context.mounted) {
        context.go(RoutePaths.login);
      }
    }
  }
}
