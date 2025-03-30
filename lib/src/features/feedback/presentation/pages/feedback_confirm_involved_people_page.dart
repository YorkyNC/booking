import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/core/widgets/tab_bar/custom_tab_bar.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_event.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_state.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_app_bar.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_suspect_tile.dart';

class FeedbackConfirmInvolvedPeoplePage extends StatelessWidget {
  const FeedbackConfirmInvolvedPeoplePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedbackBloc, FeedbackState>(
      builder: (context, state) {
        final event = state.event;
        if (event == null) {
          return Scaffold(
            backgroundColor: context.colors.gray100,
            appBar: const FeedbackAppBar(
              event: null,
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: FeedbackAppBar(event: event),
          backgroundColor: context.colors.gray100,
          body: Column(
            children: [
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: DefaultHorizontalPadding(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            context.loc.place(event.location),
                            style: context.typography.textsmRegular.copyWith(
                              color: context.colors.gray500,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                for (var i = 0; i < state.suspects.length * 2 - 1; i++)
                                  i % 2 == 0 ? FeedbackSuspectTile(suspect: state.suspects[i ~/ 2]) : const Divider(),
                                const Divider(),
                                if (state.suspects.any((e) => e.user == null))
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      context.loc.suspectListHint,
                                      textAlign: TextAlign.center,
                                      style: context.typography.textsmRegular.copyWith(
                                        color: context.colors.gray500,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Text(
                            context.loc.whoToSend,
                            style: context.typography.textmdSemibold.copyWith(
                              color: context.colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTabBar(
                            onTap: (index) => context.read<FeedbackBloc>().add(
                                  FeedbackDestinationChanged(
                                    FeedbackDestination.values[index],
                                  ),
                                ),
                            tabs: [
                              Text(context.loc.toParent),
                              Text(context.loc.toStudent),
                            ],
                          ),
                          SizedBox(
                            height: 94,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: TabBarView(
                                children: [
                                  Text(
                                    context.loc.studentWillBeInformed,
                                    style: context.typography.textsmRegular.copyWith(
                                      color: context.colors.gray500,
                                    ),
                                  ),
                                  Text(
                                    context.loc.studentWillNotBeInformed,
                                    style: context.typography.textsmRegular.copyWith(
                                      color: context.colors.gray500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => context.push(
                              "${RoutePaths.feedback}/${event.id}/${RoutePaths.description}",
                            ),
                            child: Text(context.loc.write),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: MediaQuery.paddingOf(context).bottom,
                color: context.colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
