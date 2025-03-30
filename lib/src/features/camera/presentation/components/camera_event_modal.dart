import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/presentation/widgets/event_shimmer_tile.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/slivers/divided_sliver_child_builder_delegate.dart';
import 'package:booking/src/features/review/presentation/bloc/review_bloc.dart';
import 'package:booking/src/features/review/presentation/bloc/review_state.dart';
import 'package:booking/src/core/components/events/presentation/widgets/event_tile.dart';

class CameraEventModal extends StatelessWidget {
  const CameraEventModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewBloc(),
      child: BlocBuilder<ReviewBloc, ReviewState>(
        builder: (context, state) {
          final conflicts = state.conflicts;

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Двор, Этаж 1',
                            style: context.typography.textsmRegular.copyWith(color: context.colors.gray500),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Камера 2',
                            style: context.typography.textlgSemibold.copyWith(color: context.colors.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '15 событий',
                            style: context.typography.textxsRegular.copyWith(
                              color: context.colors.gray500,
                            ),
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(
                          context.icons.delete_1__remove_add_button_buttons_delete_cross_x_mathematics_multiply_math,
                          color: context.colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (conflicts == null)
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Material(
                        color: context.colors.white,
                        child: const ReviewEventShimmerTile(),
                      ),
                      Divider(
                        height: 0,
                        color: context.colors.gray100,
                      ),
                      Material(
                        color: context.colors.white,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(12),
                        ),
                        child: const ReviewEventShimmerTile(),
                      ),
                    ],
                  ),
                )
              else
                SliverList(
                  delegate: DividedSliverChildBuilderDelegate(
                    builder: (context, index) {
                      return Material(
                        color: context.colors.white,
                        borderRadius: index == conflicts.length - 1
                            ? const BorderRadius.vertical(
                                bottom: Radius.circular(12),
                              )
                            : null,
                        child: EventTile(
                          event: conflicts[index],
                        ),
                      );
                    },
                    childCount: conflicts.length,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
