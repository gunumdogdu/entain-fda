// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconAssets {
  IconAssets._init();

  static final IconAssets _instance = IconAssets._init();

  ///Returns instace for IconAssets
  static IconAssets get instance => _instance;

  double kDefaultIconSize = 24;

  static const iconPath = 'assets/icons/';

  SvgGeneralImage get circleDoneIcon =>
      const SvgGeneralImage('${iconPath}circle_done_icon.svg');

  SvgGeneralImage get errorIcon =>
      const SvgGeneralImage('${iconPath}error_icon.svg');

  SvgGeneralImage get outlineDoneIcon =>
      const SvgGeneralImage('${iconPath}outline_done_icon.svg');

  SvgGeneralImage get outlineErrorIcon =>
      const SvgGeneralImage('${iconPath}outline_error_icon.svg');

  SvgGeneralImage get warningIcon =>
      const SvgGeneralImage('${iconPath}warning_icon.svg');

  SvgGeneralImage get brightIcon =>
      const SvgGeneralImage('${iconPath}bright_icon.svg');

  SvgGeneralImage get moonIcon =>
      const SvgGeneralImage('${iconPath}moon_icon.svg');

  SvgGeneralImage get partnerTextLogoLight =>
      const SvgGeneralImage('${iconPath}partner_text_logo_light.svg');

  SvgGeneralImage get partnerTextLogoDark =>
      const SvgGeneralImage('${iconPath}partner_text_logo_dark.svg');

  SvgGeneralImage get mailIcon =>
      const SvgGeneralImage('${iconPath}mail_icon.svg');

  SvgGeneralImage get leftArrowIcon =>
      const SvgGeneralImage('${iconPath}left_arrow_icon.svg');

  SvgGeneralImage get companiesIcon =>
      const SvgGeneralImage('${iconPath}companies_icon.svg');

  SvgGeneralImage get devicesIcon =>
      const SvgGeneralImage('${iconPath}devices_icon.svg');

  SvgGeneralImage get reportsIcon =>
      const SvgGeneralImage('${iconPath}reports_icon.svg');

  SvgGeneralImage get usersIcon =>
      const SvgGeneralImage('${iconPath}users_icon.svg');

  SvgGeneralImage get pLightIcon =>
      const SvgGeneralImage('${iconPath}p_light_icon.svg');

  SvgGeneralImage get pDarkIcon =>
      const SvgGeneralImage('${iconPath}p_dark_icon.svg');

  SvgGeneralImage get logoutIcon =>
      const SvgGeneralImage('${iconPath}logout_icon.svg');

  SvgGeneralImage get chevronLeftIcon =>
      const SvgGeneralImage('${iconPath}chevron_left_icon.svg');

  SvgGeneralImage get chevronRightIcon =>
      const SvgGeneralImage('${iconPath}chevron_right_icon.svg');

  /// List of all assets
  List<SvgGeneralImage> get values => [
        circleDoneIcon,
        errorIcon,
        outlineDoneIcon,
        outlineErrorIcon,
        warningIcon,
        brightIcon,
        moonIcon,
        partnerTextLogoLight,
        partnerTextLogoDark,
        mailIcon,
        leftArrowIcon,
        companiesIcon,
        devicesIcon,
        reportsIcon,
        usersIcon,
        pLightIcon,
        pDarkIcon,
        logoutIcon,
        chevronLeftIcon,
        chevronRightIcon,
      ];
}

class SvgGeneralImage {
  const SvgGeneralImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Color? color,
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: 'values',
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      clipBehavior: clipBehavior,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
