import 'dart:io';

import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:record/record.dart';
import 'package:uuid/uuid.dart';

enum _FeedbackInputType {
  keyboard,
  voice;
}

class FeedbackTextAudioInputView extends StatefulWidget {
  const FeedbackTextAudioInputView({
    super.key,
    required this.hintText,
    this.onTextChanged,
    this.onAudioRecorded,
    this.initialValue,
  });

  final String hintText;
  final void Function(String)? onTextChanged;

  ///Returns path to file with voice
  final void Function(String)? onAudioRecorded;
  final String? initialValue;

  @override
  State<FeedbackTextAudioInputView> createState() => _FeedbackTextAudioInputViewState();
}

class _FeedbackTextAudioInputViewState extends State<FeedbackTextAudioInputView> with SingleTickerProviderStateMixin {
  static const audioButtonInitialOffset = 52.0;
  static const keyboardButtonInitialOffset = 0.0;
  static const audioButtonInitialSize = 24.0;
  static const keyboardButtonInitialSize = 20.0;
  static const audioButtonInitialPadding = 16.0;
  static const keyboardButtonInitialPadding = 10.0;

  _FeedbackInputType _inputType = _FeedbackInputType.voice;

  final AudioRecorder _recorder = AudioRecorder();
  late AnimationController _animationController;
  late Animation<double> _buttonPositionTween;
  late Animation<double> _buttonSizeTween;
  late Animation<double> _buttonPaddingTween;

  bool _isRecordingLocked = false;
  bool _isRecordingInProgress = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _buttonPositionTween = Tween(
      begin: 0.0,
      end: audioButtonInitialOffset - keyboardButtonInitialOffset,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );
    _buttonPaddingTween = Tween(
      begin: 0.0,
      end: audioButtonInitialPadding - keyboardButtonInitialPadding,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );
    _buttonSizeTween = Tween(
      begin: 0.0,
      end: audioButtonInitialSize - keyboardButtonInitialSize,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  Future<void> _selectInputType(_FeedbackInputType inputType) async {
    if (inputType == _inputType) {
      return;
    }
    switch (inputType) {
      case _FeedbackInputType.keyboard:
        if (_isRecordingInProgress) return;
        _animationController.animateTo(1);
      case _FeedbackInputType.voice:
        await _recorder.hasPermission();
        _animationController.animateBack(0);
    }
    setState(() {
      _inputType = inputType;
    });
  }

  Future<void> _startRecord() async {
    if (_inputType != _FeedbackInputType.voice) return;
    String fileName = 'recording_${const Uuid().v4()}.m4a';
    Directory tempDir = await path_provider.getApplicationDocumentsDirectory();
    await _recorder.start(const RecordConfig(), path: '${tempDir.path}/$fileName');
    setState(() {
      _isRecordingInProgress = true;
    });
  }

  Future<void> _stopRecord() async {
    final path = await _recorder.stop();
    if (path == null) return;
    widget.onAudioRecorded?.call(path);
    setState(() {
      _isRecordingInProgress = true;
      _isRecordingLocked = false;
    });
  }

  Future<void> _stopRecordIfNotLocked() async {
    if (_isRecordingLocked || _inputType != _FeedbackInputType.voice) return;
    return _stopRecord();
  }

  Widget _getKeyboardWidget() {
    return TextFormField(
      autofocus: true,
      initialValue: widget.initialValue,
      onChanged: widget.onTextChanged,
      minLines: 5,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
    );
  }

  Widget _getAudioWidget() {
    if (widget.initialValue?.isEmpty ?? true) {
      return Center(
        child: Text(
          widget.hintText,
          style: context.typography.textmdMedium.copyWith(
            color: context.colors.gray500,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    return Center(
      child: Text(
        widget.initialValue ?? "",
        style: context.typography.textmdRegular.copyWith(
          color: context.colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _recorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: switch (_inputType) {
            _FeedbackInputType.keyboard => _getKeyboardWidget(),
            _FeedbackInputType.voice => _getAudioWidget(),
          },
        ),
        Row(
          children: [
            SizedBox(
              width: context.width / 2 - 100,
            ),
            Expanded(
              child: SizedBox(
                height: 104,
                child: AnimatedBuilder(
                  animation: _buttonPositionTween,
                  builder: (_, __) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: keyboardButtonInitialOffset + _buttonPositionTween.value,
                          child: SwitchableIconButton(
                            selected: _inputType == _FeedbackInputType.keyboard,
                            onTap: () => _selectInputType(_FeedbackInputType.keyboard),
                            size: keyboardButtonInitialSize + _buttonSizeTween.value,
                            padding: EdgeInsets.all(
                              keyboardButtonInitialPadding + _buttonPaddingTween.value,
                            ),
                            icon: context.icons.keyboard__keyboard_device_electronics_dvorak_qwerty,
                          ),
                        ),
                        Positioned(
                          left: audioButtonInitialOffset - _buttonPositionTween.value,
                          child: SwitchableIconButton(
                            selected: _inputType == _FeedbackInputType.voice,
                            onTap: () => _selectInputType(_FeedbackInputType.voice),
                            onTapDown: (_) => _startRecord(),
                            onTapUp: (_) => _stopRecordIfNotLocked(),
                            size: audioButtonInitialSize - _buttonSizeTween.value,
                            padding: EdgeInsets.all(
                              audioButtonInitialPadding - _buttonPaddingTween.value,
                            ),
                            icon: context.icons.voice_mail__mic_audio_mike_music_microphone,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
