import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class ProfileAvatar extends StatelessWidget {
  final String name;
  final String? avatarUrl;
  final double size;

  const ProfileAvatar({
    super.key,
    required this.name,
    this.avatarUrl,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: context.colors.indigo25,
        shape: BoxShape.rectangle,
        borderRadius: size == 80 ? BorderRadius.circular(20) : BorderRadius.circular(16),
      ),
      child: avatarUrl != null && avatarUrl!.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(size / 2),
              child: Image.network(
                avatarUrl!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _buildInitials(context),
              ),
            )
          : _buildInitials(context),
    );
  }

  Widget _buildInitials(BuildContext context) {
    final initials = name.split(' ').take(2).map((part) => part.isNotEmpty ? part[0].toUpperCase() : '').join('');

    return Center(
      child: Text(
        initials,
        style: size == 80
            ? context.typography.displaysmMedium.copyWith(
                color: context.colors.indigo600,
              )
            : context.typography.textxlMedium.copyWith(
                color: context.colors.indigo600,
              ),
      ),
    );
  }
}
