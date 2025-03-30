import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/duration_extension.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:video_thumbnail/video_thumbnail.dart';

class FeedbackAddParticipantSelectFrameView extends StatefulWidget {
  const FeedbackAddParticipantSelectFrameView({
    super.key,
    required this.videoUrl,
    this.onFrameSelected,
  });

  final void Function(String imagePath)? onFrameSelected;
  final String videoUrl;

  @override
  State<FeedbackAddParticipantSelectFrameView> createState() => _FeedbackAddParticipantSelectFrameViewState();
}

class _FeedbackAddParticipantSelectFrameViewState extends State<FeedbackAddParticipantSelectFrameView> {
  late final VideoPlayerController _controller;

  Duration _totalDuration = Duration.zero;
  Duration _currDuration = Duration.zero;
  double _aspectRatio = 1;
  bool loading = true;

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _controller.addListener(_onVideo);
    _controller.addListener(_onVideoInit);
    _controller.initialize();
    super.initState();
  }

  void _onVideo() {
    setState(() {
      _aspectRatio = _controller.value.aspectRatio;
      _totalDuration = _controller.value.duration;
    });
  }

  void _onVideoInit() {
    if (loading && _controller.value.isInitialized) {
      setState(() {
        loading = false;
      });
      _controller.removeListener(_onVideoInit);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onVideo);
    super.dispose();
  }

  Future<void> _onTapProgress(TapUpDetails details) async {
    final newValue = details.localPosition.dx / (MediaQuery.of(context).size.width - 32);
    setState(() {
      _currDuration = Duration(
        microseconds: (newValue * _totalDuration.inMicroseconds).round(),
      );
    });
    await _controller.seekTo(_currDuration);
  }

  void _onDragProgressUpdate(DragUpdateDetails details) async {
    final newValue = details.primaryDelta! / (MediaQuery.of(context).size.width - 32);
    final deltaOptimized = (newValue * _totalDuration.inMicroseconds).round();
    setState(() {
      _currDuration = Duration(
        microseconds: (_currDuration.inMicroseconds + deltaOptimized).clamp(0, _totalDuration.inMicroseconds),
      );
    });
    await _controller.seekTo(_currDuration);
  }

  void _onFrameSelected() async {
    setState(() {
      loading = true;
    });
    final dir = await path_provider.getApplicationCacheDirectory();
    final framePath = await VideoThumbnail.thumbnailFile(
      video: widget.videoUrl,
      timeMs: _currDuration.inMilliseconds,
      thumbnailPath: dir.path,
    );
    if (framePath == null) {
      return;
    }
    widget.onFrameSelected?.call(framePath);
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AspectRatio(
            aspectRatio: _aspectRatio,
            child: VideoPlayer(_controller),
          ),
        ),
        Positioned(
          top: context.width / _aspectRatio - 20,
          left: 0,
          right: 0,
          bottom: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: context.colors.white,
            ),
            child: DefaultHorizontalPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 12),
                  Text(
                    context.loc.selectFrame,
                    style: context.typography.textlgSemibold.copyWith(
                      color: context.colors.black,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _currDuration.formatMinSecMilli,
                          style: context.typography.displayxsSemibold.copyWith(
                            color: context.colors.black,
                          ),
                        ),
                        const SizedBox(height: 24),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTapUp: _onTapProgress,
                          onHorizontalDragUpdate: _onDragProgressUpdate,
                          child: SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                fit: StackFit.passthrough,
                                children: [
                                  ColoredBox(color: context.colors.gray100),
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    width: 3,
                                    left: math.max(
                                        _currDuration.inMicroseconds /
                                                (_totalDuration.inMicroseconds + 1) *
                                                (context.width - 32) -
                                            3,
                                        0),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: context.colors.error500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "00:00:00",
                              style: context.typography.textsmRegular.copyWith(
                                color: context.colors.gray500,
                              ),
                            ),
                            Text(
                              _totalDuration.formatMinSecMilli,
                              style: context.typography.textsmRegular.copyWith(
                                color: context.colors.gray500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _onFrameSelected,
                    child: Text(context.loc.select),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
