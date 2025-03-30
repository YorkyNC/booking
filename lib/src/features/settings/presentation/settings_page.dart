import 'dart:developer';

import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    onTap: () => context.pop(),
                    icon: context.icons.chevron_left,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Настройки аккаунта',
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
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  _buildChangePasswordButton(context),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Material(
                        color: context.colors.white,
                        borderRadius: BorderRadius.circular(12),
                        child: ListTile(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          title: Text(
                            'Set new password testing',
                            style: context.typography.textmdSemibold.copyWith(
                              color: context.colors.black,
                            ),
                          ),
                          trailing: Icon(
                            context.icons.chevron_right,
                            color: context.colors.gray400,
                          ),
                          onTap: () {
                            context.push(RoutePaths.setNewPassword, extra: '');
                          },
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Material(
                        color: context.colors.white,
                        borderRadius: BorderRadius.circular(12),
                        child: ListTile(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          title: Text(
                            'login and forgot testing',
                            style: context.typography.textmdSemibold.copyWith(
                              color: context.colors.black,
                            ),
                          ),
                          trailing: Icon(
                            context.icons.chevron_right,
                            color: context.colors.gray400,
                          ),
                          onTap: () {
                            context.push(RoutePaths.login, extra: '');
                          },
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Material(
                        color: context.colors.white,
                        borderRadius: BorderRadius.circular(12),
                        child: ListTile(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          title: Text(
                            'update password testing',
                            style: context.typography.textmdSemibold.copyWith(
                              color: context.colors.black,
                            ),
                          ),
                          trailing: Icon(
                            context.icons.chevron_right,
                            color: context.colors.gray400,
                          ),
                          onTap: () {
                            context.push(RoutePaths.updatePassword, extra: '');
                          },
                        ),
                      )),
                ]),
              ),
            ),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildChangePasswordButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          title: Text(
            'Сменить пароль',
            style: context.typography.textmdSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
          trailing: Icon(
            context.icons.chevron_right,
            color: context.colors.gray400,
          ),
          onTap: () {
            context.push(RoutePaths.changePassword);
          },
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          _showLogoutConfirmationModal(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            title: Text(
              'Выйти из аккаунта',
              style: context.typography.textmdSemibold.copyWith(
                color: context.colors.error500,
              ),
            ),
            trailing: Icon(
              context.icons.logout_1__arrow_exit_frame_leave_logout_rectangle_right,
              color: context.colors.error500,
            ),
            onTap: () => _showLogoutConfirmationModal(context),
          ),
        ),
      ),
    );
  }

  void _showLogoutConfirmationModal(BuildContext context) {
    showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.4,
      ),
      backgroundColor: context.colors.white,
      useSafeArea: true,
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return LogoutConfirmationModal(
          onLogout: () {
            context.pop();
            _handleSignOut(context);
          },
        );
      },
    );
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

class LogoutConfirmationModal extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutConfirmationModal({
    super.key,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Выход',
                    style: context.typography.textlgSemibold.copyWith(
                      color: context.colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(
                      context.icons.delete_1__remove_add_button_buttons_delete_cross_x_mathematics_multiply_math,
                      color: context.colors.black,
                    ),
                    // padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Вы точно хотите выйти из аккаунта?',
                style: context.typography.textxlBold.copyWith(
                  color: context.colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Material(
                    color: const Color(0xFFD92D20),
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: onLogout,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        alignment: Alignment.center,
                        child: Text(
                          'Выйти',
                          style: context.typography.textmdSemibold.copyWith(
                            color: context.colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Material(
                    color: context.colors.white,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () => context.pop(),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFD5D7DA)),
                        ),
                        child: Text(
                          'Отмена',
                          style: context.typography.textmdSemibold.copyWith(
                            color: const Color(0xFF414651),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
