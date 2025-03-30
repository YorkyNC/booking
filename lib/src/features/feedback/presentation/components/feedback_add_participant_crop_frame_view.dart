import 'dart:io' as io;

import 'package:crop_your_image/crop_your_image.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/layout/two_children_overlapping_view.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';

class FeedbackAddParticipantCropFrameView extends StatefulWidget {
  const FeedbackAddParticipantCropFrameView({
    super.key,
    required this.imageUrl,
    this.onImageCropped,
  });

  final String imageUrl;
  final void Function(String imagePath)? onImageCropped;

  @override
  State<FeedbackAddParticipantCropFrameView> createState() => _FeedbackAddParticipantCropFrameViewState();
}

class _FeedbackAddParticipantCropFrameViewState extends State<FeedbackAddParticipantCropFrameView> {
  bool _loading = true;
  late Uint8List _image;
  final _cropController = CropController();

  void _cropImage() {
    _cropController.crop();
    setState(() {
      _loading = true;
    });
  }

  void _onCrop(CropResult cropResult) {
    switch (cropResult) {
      case CropSuccess(croppedImage: final croppedImage):
        final newPath = "${widget.imageUrl}.cropped.png";
        io.File(newPath).writeAsBytesSync(croppedImage);
        widget.onImageCropped?.call(newPath);
      case CropFailure():
        setState(() {
          _loading = false;
        });
    }
  }

  @override
  void initState() {
    _readImage();
    super.initState();
  }

  void _readImage() {
    _image = io.File(widget.imageUrl).readAsBytesSync();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return TwoChildrenOverlappingView(
      firstChild: Crop(
        controller: _cropController,
        image: _image,
        onCropped: _onCrop,
      ),
      secondChild: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: context.colors.white,
        ),
        child: DefaultHorizontalPadding(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              Text(
                context.loc.selectFrame,
                style: context.typography.textlgSemibold.copyWith(
                  color: context.colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: _cropImage,
                child: Text(context.loc.select),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      childPriority: TwoChildrenOverlappingPriority.second,
    );
  }
}
