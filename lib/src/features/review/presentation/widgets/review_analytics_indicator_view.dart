import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_nullable_wrapper.dart';

class ReviewAnalyticsIndicatorView extends StatefulWidget {
  const ReviewAnalyticsIndicatorView({
    super.key,
    required this.color,
    required this.assetPath,
    required this.title,
    this.value,
  });

  final Color color;
  final String assetPath;
  final String title;
  final int? value;

  @override
  State<ReviewAnalyticsIndicatorView> createState() => _ReviewAnalyticsIndicatorViewState();
}

class _ReviewAnalyticsIndicatorViewState extends State<ReviewAnalyticsIndicatorView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  //TODO might be wrong
  static const _maxValue = 70;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    if (widget.value != null) {
      _controller.animateTo(math.min(widget.value! / _maxValue, 1));
    }
  }

  @override
  void didUpdateWidget(covariant ReviewAnalyticsIndicatorView oldWidget) {
    final value = widget.value;
    if (value != oldWidget.value) {
      if (value == null) {
        _controller.animateTo(
          0,
          duration: const Duration(
            seconds: 1,
          ),
        );
      } else {
        _controller.animateTo(
          math.min(value / _maxValue, 1),
          duration: const Duration(
            seconds: 1,
          ),
        );
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 117,
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return LinearProgressIndicator(
                  minHeight: 6,
                  backgroundColor: context.colors.gray100,
                  value: _controller.value,
                  color: widget.color,
                  borderRadius: BorderRadius.circular(12),
                );
              },
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 52,
                height: 52,
                child: SvgPicture.asset(widget.assetPath),
              ),
              const SizedBox(height: 12),
              Text(
                widget.title,
                style: context.typography.typography1Regular.copyWith(
                  color: const Color(0xFF6E7178),
                ),
              ),
              const SizedBox(height: 4),
              ShimmerNullableWrapper(
                height: 28,
                width: 54,
                value: widget.value,
                builder: (ctx, value) => Text(
                  value.toString(),
                  style: context.typography.typography2Medium.copyWith(
                    color: context.colors.black,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
