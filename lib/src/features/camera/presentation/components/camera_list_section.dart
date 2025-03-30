import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/camera/domain/entities/camera_entity.dart';
import 'package:booking/src/features/camera/domain/entities/camera_section_entity.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_bloc.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_state.dart';
import 'package:booking/src/features/camera/presentation/components/camera_event_modal.dart';

class CameraListSection extends StatefulWidget {
  const CameraListSection({super.key});

  @override
  State<CameraListSection> createState() => _CameraListSectionState();
}

class _CameraListSectionState extends State<CameraListSection> {
  final Map<String, bool> _expandedSections = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraBloc, CameraState>(
      builder: (context, state) {
        if (state.cameraSections == null) {
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(
                color: context.colors.brand100,
              ),
            ),
          );
        }

        final sections = state.isSearching ? state.filteredCameraSections! : state.cameraSections!;

        if (sections.isEmpty) {
          return Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 48,
                    color: context.colors.gray400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Ничего не найдено',
                    style: context.typography.textlgMedium.copyWith(
                      color: context.colors.gray500,
                    ),
                  ),
                  if (state.isSearching)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Попробуйте изменить параметры поиска',
                        style: context.typography.textmdRegular.copyWith(
                          color: context.colors.gray400,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }

        return Expanded(
          child: ListView(
            children: sections.asMap().entries.map((entry) {
              final isLast = entry.key == sections.length - 1;
              final section = entry.value;

              if (!_expandedSections.containsKey(section.id)) {
                _expandedSections[section.id] = true;
              }

              return Column(
                children: [
                  _buildExpandableSection(section),
                  if (!isLast) const SizedBox(height: 8),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _buildExpandableSection(CameraSectionEntity section) {
    final subtitle =
        'Этаж ${section.floor}, ${section.cameraCount} ${_getCamerasText(section.cameraCount)}, ${section.eventCount} ${_getEventsText(section.eventCount)}';

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      child: Material(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(8),
        child: ExpansionTile(
          key: Key(section.id),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          collapsedBackgroundColor: context.colors.white,
          backgroundColor: context.colors.white,
          initiallyExpanded: _expandedSections[section.id] ?? true,
          collapsedIconColor: context.colors.gray500,
          iconColor: context.colors.gray500,
          onExpansionChanged: (expanded) {
            setState(() {
              _expandedSections[section.id] = expanded;
            });
          },
          title: Text(
            section.location,
            style: context.typography.textmdSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: context.typography.textsmRegular.copyWith(
              color: context.colors.gray500,
            ),
          ),
          children: _buildCameraItems(section.cameras),
        ),
      ),
    );
  }

  List<Widget> _buildCameraItems(List<CameraEntity> cameras) {
    return cameras.map((camera) {
      return Material(
        color: context.colors.white,
        child: ListTile(
          leading: SvgPicture.asset(context.assetImages.cameraFilledRed),
          title: Text(
            camera.name,
            style: context.typography.textmdSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
          subtitle: Text(
            '${camera.cameraEventCount} ${_getEventsText(camera.cameraEventCount)}',
            style: context.typography.textsmRegular.copyWith(
              color: context.colors.gray500,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: context.colors.gray500,
          ),
          onTap: () {
            showModalBottomSheet(
              backgroundColor: context.colors.white,
              showDragHandle: true,
              useSafeArea: true,
              useRootNavigator: true,
              context: context,
              builder: (context) {
                return const CameraEventModal();
              },
            );
          },
        ),
      );
    }).toList();
  }

  String _getCamerasText(int count) {
    if (count == 1) return 'камера';
    if (count > 1 && count < 5) return 'камеры';
    return 'камер';
  }

  String _getEventsText(int count) {
    if (count == 1) return 'событие';
    if (count > 1 && count < 5) return 'события';
    return 'событий';
  }
}
