import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/popups/sheet_popup.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_bloc.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_event.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_state.dart';
import 'package:booking/src/features/camera/presentation/components/camera_filter_view.dart';

Future<void> showCameraFilterPopup(BuildContext context) {
  return showSheetPopup(context,
      title: Text(
        context.loc.filters,
        style: context.typography.typography3SemiBold.copyWith(
          color: context.colors.black,
        ),
      ),
      builder: (_) => BlocProvider.value(
            value: context.read<CameraBloc>(),
            child: BlocBuilder<CameraBloc, CameraState>(
              builder: (context, state) {
                return CameraFilterView(
                  initialFilter: state.filter,
                  count: state.count,
                  onFilterConfirm: (filter) {
                    context.read<CameraBloc>().add(
                          CameraFilterUpdated(filter),
                        );
                    context.pop();
                  },
                  onFilterSelected: (filter) {
                    context.read<CameraBloc>().add(
                          CameraPreliminaryCountFetched(),
                        );
                  },
                );
              },
            ),
          ));
}
