import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class FeedbackSheetWrapper extends StatelessWidget {
  const FeedbackSheetWrapper({super.key, required this.background, required this.child});

  final Widget background;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Positioned(
          height: 230,
          left: 0,
          right: 0,
          child: background,
        ),
        Positioned(
          top: 14,
          left: 0,
          right: 0,
          bottom: 8,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                pinned: true,
                expandedHeight: 206,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(8),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                // flexibleSpace: GestureDetector(
                //   behavior: HitTestBehavior.opaque,
                //   onTap: () => context.push(
                //     RoutePaths.eventVideo,
                //     extra: event,
                //   ),
                //   child: const FlexibleSpaceBar(
                //     // background:,
                //   ),
                // ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  child: ColoredBox(
                    color: context.colors.white,
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
