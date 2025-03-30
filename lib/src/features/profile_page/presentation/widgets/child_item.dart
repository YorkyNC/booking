import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

import '../../domain/entities/profile.dart';
import 'profile_avatar.dart';

class ChildItem extends StatelessWidget {
  final Child child;

  const ChildItem({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          name: child.name,
          avatarUrl: child.avatarUrl,
          size: 50,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                child.name,
                style: context.typography.textmdMedium.copyWith(
                  color: context.colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                child.email,
                style: context.typography.textsmMedium.copyWith(
                  color: context.colors.gray500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
