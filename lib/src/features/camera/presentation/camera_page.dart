import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_bloc.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_event.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_state.dart';
import 'package:booking/src/features/camera/presentation/components/camera_app_bar.dart';
import 'package:booking/src/features/camera/presentation/components/camera_list_section.dart';
import 'package:booking/src/features/camera/presentation/components/camera_sections_shimmer.dart';
import 'package:booking/src/features/camera/presentation/components/custom_fliter_chip.dart';
import 'package:booking/src/features/class_events/presentation/components/custom_search_bar.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final String searchHeroTag = 'camera_search_bar';
  late CameraBloc _cameraBloc;

  void _navigateToSearch() async {
    final result = await context.push(
      RoutePaths.cameraSearch,
      extra: {'heroTag': searchHeroTag},
    );
    if (result != null) {
      _cameraBloc.add(CameraSearchChanged(result as String));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _cameraBloc = CameraBloc();
        return _cameraBloc;
      },
      child: Scaffold(
        backgroundColor: context.colors.gray100,
        appBar: const CameraAppBar(),
        body: BlocBuilder<CameraBloc, CameraState>(
          builder: (context, state) {
            if (state.cameraSections == null) {
              return CameraSectionsShimmer(context: context);
            }

            final sections = state.cameraSections!;

            return Column(
              children: [
                Container(
                  color: context.colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CustomFliterChip(
                              context: context,
                              label: 'Все',
                              isSelected: true,
                              onTap: () => context.read<CameraBloc>().add(
                                    const CameraFilterToggled('all'),
                                  ),
                            ),
                            ...sections
                                .map((section) => CustomFliterChip(
                                      context: context,
                                      label: section.location,
                                      isSelected: state.selectedFilters[section.id] ?? false,
                                      onTap: () => context.read<CameraBloc>().add(
                                            CameraFilterToggled(section.id),
                                          ),
                                    ))
                                .toList(),
                          ],
                        ),
                      ),
                      BlocBuilder<CameraBloc, CameraState>(
                        builder: (context, state) {
                          return CustomSearchBar(
                            heroTag: searchHeroTag,
                            hintText: state.searchQuery.isEmpty ? context.loc.search : state.searchQuery,
                            onTap: _navigateToSearch,
                            readOnly: false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const CameraListSection(),
              ],
            );
          },
        ),
      ),
    );
  }
}
