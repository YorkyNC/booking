import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

import '../../domain/entities/profile.dart';

class RoleSelector extends StatelessWidget {
  final Role currentRole;
  final List<Role> roles;
  final Function(Role) onRoleSelected;

  const RoleSelector({
    super.key,
    required this.currentRole,
    required this.roles,
    required this.onRoleSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Only show the role selector if there are multiple roles
    if (roles.length <= 1) {
      return _buildRoleInfo(context);
    }

    return InkWell(
      onTap: () => _showRoleSelectionModal(context),
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.colors.gray200,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          child: Row(
            children: [
              Expanded(
                child: _buildRoleInfo(context),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: context.colors.gray500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Роль',
          style: context.typography.textsmRegular.copyWith(
            color: context.colors.gray500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          currentRole.name,
          style: context.typography.textmdSemibold.copyWith(
            color: context.colors.black,
          ),
        ),
      ],
    );
  }

  void _showRoleSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      builder: (context) => RoleSelectionModal(
        roles: roles,
        currentRole: currentRole,
        onRoleSelected: (role) {
          context.pop();
          onRoleSelected(role);
        },
      ),
    );
  }
}

class RoleSelectionModal extends StatelessWidget {
  final List<Role> roles;
  final Role currentRole;
  final Function(Role) onRoleSelected;

  const RoleSelectionModal({
    super.key,
    required this.roles,
    required this.currentRole,
    required this.onRoleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Переключиться',
                  style: context.typography.textlgSemibold.copyWith(
                    color: context.colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    Icons.close,
                    color: context.colors.gray500,
                    size: 24,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          ...roles.map((role) => _buildRoleItem(context, role)).toList(),
        ],
      ),
    );
  }

  Widget _buildRoleItem(BuildContext context, Role role) {
    final isSelected = role.name == currentRole.name;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: InkWell(
              onTap: () => onRoleSelected(role),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? context.colors.blueGray50 : context.colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              role.name,
                              style: context.typography.textmdSemibold.copyWith(
                                color: context.colors.black,
                              ),
                            ),
                            if (role.description.isNotEmpty)
                              Text(
                                role.description,
                                style: context.typography.textsmRegular.copyWith(
                                  color: context.colors.gray500,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Radio<bool>(
                        value: true,
                        groupValue: isSelected ? true : false,
                        activeColor: context.colors.blueGray400,
                        onChanged: (_) => onRoleSelected(role),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
