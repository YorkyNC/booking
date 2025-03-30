import 'package:flutter_svg/flutter_svg.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/features/feedback/presentation/components/event_video_app_bar.dart';
import 'package:video_player/video_player.dart';

class EventVideoPage extends StatefulWidget {
  const EventVideoPage({
    super.key,
    required this.event,
  });

  final EventEntity event;

  @override
  State<EventVideoPage> createState() => _EventVideoPageState();
}

class _EventVideoPageState extends State<EventVideoPage> {
  late final VideoPlayerController _controller;

  Duration _totalDuration = Duration.zero;
  Duration _currDuration = Duration.zero;
  double _aspectRatio = 1;
  bool _isPaused = false;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.event.videoUrl));
    _controller.addListener(_onVideo);
    _controller.initialize();
    _controller.play();
    super.initState();
  }

  void _onVideo() {
    setState(() {
      _aspectRatio = _controller.value.aspectRatio;
      _currDuration = _controller.value.position;
      _totalDuration = _controller.value.duration;
      _isPaused = !_controller.value.isPlaying;
    });
  }

  void _switchPause() {
    if (_isPaused) {
      _controller.play();
    } else {
      _controller.pause();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onVideo);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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

  void _onDragProgressStart(DragStartDetails _) {
    _controller.pause();
  }

  void _onDragProgressUpdate(DragUpdateDetails details) {
    final newValue = details.primaryDelta! / (MediaQuery.of(context).size.width - 32);
    final deltaOptimized = (newValue * _totalDuration.inMicroseconds).round();
    setState(() {
      _currDuration = Duration(
        microseconds: (_currDuration.inMicroseconds + deltaOptimized).clamp(0, _totalDuration.inMicroseconds),
      );
    });
  }

  Future<void> _onDragProgressEnd(DragEndDetails _) async {
    await _controller.seekTo(_currDuration);
    await _controller.play();
  }

  Future<void> _onFullScreenRequested() async {
    if (context.height > context.width) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
      ]);
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
  }

  String get timestamp => "00:${_currDuration.inSeconds.toString().padLeft(2, "0")} / "
      "00:${_totalDuration.inSeconds.toString().padLeft(2, "0")}";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.gray900,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: _aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),
          if (_isPaused)
            Center(
              child: SvgPicture.asset(
                context.assetImages.play,
              ),
            ),
          GestureDetector(
            onTap: _switchPause,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: EventVideoAppBar(event: widget.event),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SafeArea(
              left: false,
              right: false,
              child: Column(
                children: [
                  DefaultHorizontalPadding(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            timestamp,
                            style: context.typography.textsmRegular.copyWith(
                              color: context.colors.white,
                              height: 1,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: _onFullScreenRequested,
                          padding: const EdgeInsets.all(12),
                          icon: Icon(
                            context.icons.full_screen,
                            size: 20,
                            color: context.colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DefaultHorizontalPadding(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTapUp: _onTapProgress,
                      onHorizontalDragStart: _onDragProgressStart,
                      onHorizontalDragUpdate: _onDragProgressUpdate,
                      onHorizontalDragEnd: _onDragProgressEnd,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: LinearProgressIndicator(
                          color: context.colors.brand500,
                          borderRadius: BorderRadius.circular(56),
                          backgroundColor: context.colors.white,
                          value: _currDuration.inMicroseconds / (_totalDuration.inMicroseconds + 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
