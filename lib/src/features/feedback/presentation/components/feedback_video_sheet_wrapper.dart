import 'package:flutter_svg/flutter_svg.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/widgets/layout/two_children_overlapping_view.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class FeedbackVideoSheetWrapper extends StatelessWidget {
  const FeedbackVideoSheetWrapper({
    super.key,
    required this.event,
    required this.child,
    this.thumbnail,
  });

  final EventEntity event;
  final Uint8List? thumbnail;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final thumbnail = this.thumbnail;
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(
          12,
        ),
      ),
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: TwoChildrenOverlappingView(
              firstChild: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => context.push(
                  RoutePaths.eventVideo,
                  extra: event,
                ),
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    thumbnail != null
                        ? Image.memory(
                            thumbnail,
                            fit: BoxFit.fitWidth,
                          )
                        : ShimmerContainer(
                            width: double.infinity,
                            height: context.height / 4,
                          ),
                    Positioned.fill(
                      child: Center(
                        child: SvgPicture.asset(
                          context.assetImages.play,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              secondChild: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 12),
                    DefaultHorizontalPadding(
                      child: Text(
                        context.loc.place(event.location),
                        style: context.typography.textsmRegular.copyWith(
                          color: context.colors.gray500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(child: child),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
