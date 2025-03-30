import 'package:flutter/material.dart';
import 'package:booking/gen/assets.gen.dart';
import 'package:booking/src/core/localization/generated/l10n.dart';
import 'package:booking/src/core/theme/colors.dart';
import 'package:booking/src/core/theme/theme.dart';
import 'package:booking/src/core/theme/typography.dart';
import 'package:booking/src/core/utils/constants/app_icons.dart';

extension BuildContextExtension on BuildContext {
  S get loc => S.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get userGestureInProgress => Navigator.of(this).userGestureInProgress;

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;
  double get bottomViewInset => MediaQuery.of(this).viewInsets.bottom;

  $AssetsAppImagesGen get assetImages => Assets.appImages;
  $AssetsIconsGen get assetIcons => Assets.icons;
  AppColors get colors => AppTheme.colors;
  FigmaTextStyles get typography => AppTheme.typography;
  AppIcons get icons => AppTheme.icons;
}
