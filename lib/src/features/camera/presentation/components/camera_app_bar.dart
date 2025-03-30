import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:booking/src/core/components/filter/domain/extensions/date_filter_extension.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';
import 'package:booking/src/features/camera/domain/entities/enums/sorting_options.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_bloc.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_event.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_state.dart';
import 'package:booking/src/features/camera/presentation/components/popups/show_camera_filter_popup.dart';
import 'package:booking/src/features/camera/presentation/components/popups/show_camera_sort_popup.dart';

class CameraAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CameraAppBar({super.key});

  @override
  State<CameraAppBar> createState() => _CameraAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CameraAppBarState extends State<CameraAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraBloc, CameraState>(
      buildWhen: (previous, current) => previous.filter != current.filter || previous.sort != current.sort,
      builder: (context, state) {
        return Container(
          color: context.colors.white,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SwitchableIconButton(
                          onTap: () {
                            context.pop();
                          },
                          icon: context.icons.chevron_left,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          context.loc.cameras,
                          style: context.typography.textlgBold.copyWith(
                            color: context.colors.gray800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SwitchableIconButton(
                        selected: state.filter.isDefault,
                        icon: context.icons.filter_2__funnel_filter_angle_oil,
                        onTap: () {
                          showCameraFilterPopup(context);
                        },
                      ),
                      const SizedBox(width: 12),
                      SwitchableIconButton(
                        selected: state.sort != CameraSorting.moreEvents,
                        icon: context.icons.sort_descending,
                        onTap: () {
                          showCameraSortPopup(
                            context,
                            initialSort: state.sort,
                            onSortUpdated: (sort) => context.read<CameraBloc>().add(
                                  CameraSortUpdated(sort),
                                ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
