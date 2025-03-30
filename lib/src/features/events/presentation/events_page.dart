import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/services/injectable/injectable_service.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';
import 'package:booking/src/core/widgets/slivers/divided_sliver_child_builder_delegate.dart';
import 'package:booking/src/features/events/presentation/bloc/events_bloc.dart';
import 'package:booking/src/features/events/presentation/bloc/events_state.dart';
import 'package:booking/src/features/events/presentation/components/events_app_bar.dart';
import 'package:booking/src/core/components/events/presentation/widgets/event_shimmer_tile.dart';
import 'package:booking/src/core/components/events/presentation/widgets/event_tile.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EventsBloc>(),
      child: Scaffold(
        appBar: const EventsAppBar(),
        backgroundColor: context.colors.gray100,
        body: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            final events = state.events;
            if (events == null) {
              return Container(
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 8),
                      child: ShimmerContainer(width: 95, height: 24),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 100,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const ReviewEventShimmerTile();
                        },
                        separatorBuilder: (context, _) {
                          return const Divider(
                            height: 0,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                    decoration: BoxDecoration(
                      color: context.colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      context.loc.total(events.length),
                      style: context.typography.typography2Regular.copyWith(
                        color: context.colors.gray500,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: DividedSliverChildBuilderDelegate(
                    builder: (context, index) {
                      return Material(
                        color: context.colors.white,
                        borderRadius: index == events.length - 1
                            ? const BorderRadius.vertical(
                                bottom: Radius.circular(12),
                              )
                            : null,
                        child: EventTile(
                          event: events[index],
                        ),
                      );
                    },
                    childCount: events.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
