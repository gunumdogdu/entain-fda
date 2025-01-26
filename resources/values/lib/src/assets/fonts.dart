// ignore_for_file: public_member_api_docs

class FontAsset {
  const FontAsset();

  static const baseImagePath = 'assets/fonts/';

  AssetGeneralFont get interBlack => const AssetGeneralFont(
        '${baseImagePath}SF-Pro.ttf',
      );

  AssetGeneralFont get interBold => const AssetGeneralFont(
        '${baseImagePath}SF-Pro.ttf',
      );

  AssetGeneralFont get interExtraBold => const AssetGeneralFont(
        '${baseImagePath}SF-Pro.ttf',
      );
  AssetGeneralFont get interExtralight => const AssetGeneralFont(
        '${baseImagePath}SF-Pro.ttf',
      );
  AssetGeneralFont get interMedium => const AssetGeneralFont(
        '${baseImagePath}SF-Pro.ttf',
      );
  AssetGeneralFont get interRegular => const AssetGeneralFont(
        '${baseImagePath}SF-Pro.ttf',
      );
  AssetGeneralFont get interSemiBold => const AssetGeneralFont(
        '${baseImagePath}SF-Pro.ttf',
      );
  AssetGeneralFont get interThin => const AssetGeneralFont(
        '${baseImagePath}SF-Pro.ttf',
      );

  /// List of all assets
  List<AssetGeneralFont> get values => [
        interBlack,
        interBold,
      ];
}

class AssetGeneralFont {
  const AssetGeneralFont(this._assetName);

  final String _assetName;

  String get path => _assetName;

  String get absolutePath => 'packages/values/$path';

  String get keyName => _assetName;
}
