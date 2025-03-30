import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

import '../domain/entities/profile.dart';
import 'bloc/profile_bloc.dart';
import 'widgets/child_item.dart';
import 'widgets/class_item.dart';
import 'widgets/notification_switch.dart';
import 'widgets/profile_app_bar.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/role_selector.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _showAppBarProfile = false;
  Role? _previousRole;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final scrollPercentage = (_scrollController.offset / 150).clamp(0.0, 1.0);
    _animationController.value = scrollPercentage;

    final showAppBarProfile = scrollPercentage > 0.5;
    if (showAppBarProfile != _showAppBarProfile) {
      setState(() {
        _showAppBarProfile = showAppBarProfile;
      });
    }
  }

  void _resetScrollPosition() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
    _animationController.animateTo(0);
    setState(() {
      _showAppBarProfile = false;
    });
  }

  void _checkRoleChange(Profile profile) {
    if (_previousRole != null && _previousRole != profile.currentRole) {
      _resetScrollPosition();
    }
    _previousRole = profile.currentRole;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<ProfileBloc>()..add(const LoadProfile()),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: context.colors.gray100,
          appBar: ProfileAppBar(showProfile: _showAppBarProfile),
          body: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is ProfileLoaded) {
                _checkRoleChange(state.profile);
              }
            },
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileError) {
                return Center(child: Text(state.message));
              } else if (state is ProfileLoaded) {
                return _buildProfileContent(context, state.profile);
              }
              return const SizedBox.shrink();
            },
          ),
        );
      }),
    );
  }

  Widget _buildProfileContent(BuildContext context, Profile profile) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          sliver: SliverToBoxAdapter(
            child: AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: 1 - _fadeAnimation.value,
                  child: child,
                );
              },
              child: _buildUserInfo(context, profile),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 12),
          sliver: SliverToBoxAdapter(
            child: _buildRoleSelector(context, profile),
          ),
        ),
        if (profile.currentRole.isParent)
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 12),
            sliver: _buildChildrenSliverList(context, profile.children),
          ),
        if (profile.currentRole.isTeacher)
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 12),
            sliver: _buildClassesSliverList(context, profile.classes),
          ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 12),
          sliver: SliverToBoxAdapter(
            child: _buildNotificationsSection(context, profile.notificationSettings),
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo(BuildContext context, Profile profile) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Row(
          children: [
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                // Scale down as we scroll
                final scale = 1.0 - (_fadeAnimation.value * 0.2);
                return Transform.scale(
                  scale: scale,
                  child: child,
                );
              },
              child: Hero(
                tag: 'profile_avatar',
                child: ProfileAvatar(
                  name: profile.name,
                  avatarUrl: profile.avatarUrl,
                  size: 80,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'profile_name',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        profile.name,
                        style: context.typography.textxlBold.copyWith(
                          color: context.colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  AnimatedBuilder(
                    animation: _fadeAnimation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: 1.0 - _fadeAnimation.value,
                        child: child,
                      );
                    },
                    child: Text(
                      profile.email,
                      style: context.typography.textsmRegular.copyWith(
                        color: context.colors.gray500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleSelector(BuildContext context, Profile profile) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: RoleSelector(
          currentRole: profile.currentRole,
          roles: profile.roles,
          onRoleSelected: (role) {
            context.read<ProfileBloc>().add(UpdateCurrentRole(role));
          },
        ),
      ),
    );
  }

  Widget _buildChildrenSliverList(BuildContext context, List<Child> children) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Text(
                'Дети',
                style: context.typography.textmdSemibold.copyWith(
                  color: context.colors.black,
                ),
              ),
            ),
            ...children.map((child) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: ChildItem(child: child),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildClassesSliverList(BuildContext context, List<ClassInfo> classes) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
              child: Text(
                'Классы',
                style: context.typography.textmdSemibold.copyWith(
                  color: context.colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: classes.map((classInfo) => ClassItem(classInfo: classInfo)).toList(),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationsSection(BuildContext context, NotificationSettings settings) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NotificationSwitch(
            title: 'Уведомления',
            value: settings.notifications,
            onChanged: (value) {
              context.read<ProfileBloc>().add(UpdateNotifications(value));
            },
          ),
          NotificationSwitch(
            title: 'Приход и уход',
            value: settings.attendanceNotifications,
            onChanged: (value) {
              context.read<ProfileBloc>().add(UpdateAttendanceNotifications(value));
            },
          ),
          NotificationSwitch(
            title: 'События',
            value: settings.eventsNotifications,
            onChanged: (value) {
              context.read<ProfileBloc>().add(UpdateEventsNotifications(value));
            },
          ),
        ],
      ),
    );
  }
}
