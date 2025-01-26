///Enum That represent platform type.
enum PlatformType {
  ///ANDROID
  android,
  ///IOS
  ios,
}

///Enum That represent loading statusses.
enum LoadingStatus {
  ///Screen is initializng
  init,
  ///Screen is loading
  loading,
  ///Screen is loaded but another async call made after
  processing,
  ///Screen is loaded and there is no operation
  loaded,
  ///Error occured during action.
  error,
  ///Error occured during action.
}

///Enum That represent socket statusses.
enum SocketStatus {
  ///Screen is initializng
  loading,
  ///Screen is loaded and there is no operation
  connected,
  ///Error occured during action.
  error,
}

///Enum That represent App Environments.
enum AppEnvironment {
  ///Prod
  production,
  ///Dev
  development,
}
