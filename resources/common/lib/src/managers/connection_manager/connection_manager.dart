import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_io/io.dart';

///This class is created for managing connection status.
class ConnectionManager {
  ConnectionManager._();

  static final _instance = ConnectionManager._();

  ///Connection manager instance
  static ConnectionManager get instance => _instance;

  final _hasConnectionStreamController = StreamController<bool>();
  final _serverPingStreamController = StreamController<ConnectionStatusModel>();
  final Connectivity _connectivity = Connectivity();

  final Duration _lookUpConnectionDelay = const Duration(seconds: 10);
  final String _checkInternetURL = 'google.com';

  ///This function initialize the necessary fields within [ConnectionManager]
  ///You have to initialize the class before using
  /// anything within [ConnectionManager]
  void init() {
    _connectivity.onConnectivityChanged.listen((dynamic result) async {
      final connectivityResult = result is List
          ? (result as List<ConnectivityResult>).firstOrNull ??
              ConnectivityResult.none
          : result as ConnectivityResult;
      await _handleConnectivityChange(connectivityResult);
    });
    Timer.periodic(
      _lookUpConnectionDelay,
      (timer) => _serverPing(),
    );
  }

  Future<void> _handleConnectivityChange(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      _updateStreamController(false);
    } else {
      final isAvailable = await isInternetAvailable();
      _updateStreamController(isAvailable);
    }
  }

  ///This method checks if there is valid internet connection.
  Future<bool> isInternetAvailable() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _updateStreamController(false);
      return false;
    }

    try {
      if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
        final result = await InternetAddress.lookup(_checkInternetURL);
        final isActive = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
        _updateStreamController(isActive);
        return isActive;
      } else {
        // For web and other platforms, we'll consider them connected if they have network connectivity
        _updateStreamController(true);
        return true;
      }
    } catch (_) {
      _updateStreamController(false);
      return false;
    }
  }

  ///It's updating the controller for stream
  void _updateStreamController(bool result) {
    _hasConnectionStreamController.sink.add(result);
  }

  ///It return current internet status as bool as stream.
  Stream<bool> getInternetAvailabilityStream() {
    return _hasConnectionStreamController.stream;
  }

  void _updateServerPingStreamController(ConnectionStatusModel model) {
    _serverPingStreamController.sink.add(model);
  }

  ///It return current internet performance as
  ///[ConnectionStatusModel] as stream.
  Stream<ConnectionStatusModel> serverPingStream() {
    return _serverPingStreamController.stream;
  }

  // ignore: flutter_style_todos
  Future<void> _serverPing() async {
    if (kIsWeb) {
      // For web, we'll just use the connectivity status
      final result = await _connectivity.checkConnectivity();
      _updateServerPingStreamController(
        ConnectionStatusModel(
          connectionStatus: result != ConnectivityResult.none
              ? ConnectionStatusEnum.ok
              : ConnectionStatusEnum.error,
          isWebSocket: false,
        ),
      );
      return;
    }

    final stopwatch = Stopwatch()..start();
    try {
      final response = await HttpClient()
          .getUrl(Uri.https(_checkInternetURL))
          .then((value) => value.close());
      if (response.statusCode == HttpStatus.ok) {
        stopwatch.stop();
        _updateServerPingStreamController(
          _createConnectionModel(stopwatch.elapsedMilliseconds, false),
        );
      }
    } catch (e) {
      _updateServerPingStreamController(
        ConnectionStatusModel(
          connectionStatus: ConnectionStatusEnum.error,
          isWebSocket: false,
        ),
      );
    }
  }

  ConnectionStatusModel _createConnectionModel(
    int stopWatchValue,
    bool isWebSocket,
  ) {
    if (stopWatchValue > 400) {
      return ConnectionStatusModel(
        isWebSocket: isWebSocket,
        connectionStatus: ConnectionStatusEnum.slow,
        connectionDelay: stopWatchValue,
      );
    } else if (stopWatchValue > 250 && stopWatchValue < 400) {
      return ConnectionStatusModel(
        isWebSocket: isWebSocket,
        connectionStatus: ConnectionStatusEnum.normal,
        connectionDelay: stopWatchValue,
      );
    } else if (stopWatchValue > 0 && stopWatchValue < 250) {
      return ConnectionStatusModel(
        isWebSocket: isWebSocket,
        connectionStatus: ConnectionStatusEnum.ok,
        connectionDelay: stopWatchValue,
      );
    }
    return ConnectionStatusModel(
      isWebSocket: isWebSocket,
    );
  }
}

///Class that returns everytingh related to connection statusses.
class ConnectionStatusModel {
  ///
  ConnectionStatusModel({
    this.isWebSocket,
    this.connectionStatus,
    this.connectionDelay,
  });

  ///Is current connection is webSocket.
  final bool? isWebSocket;

  ///Is current connection status as [ConnectionStatusModel].
  final ConnectionStatusEnum? connectionStatus;

  ///Delay value for the current check.
  final int? connectionDelay;
}

///Enum that represent ConnectionStatus
enum ConnectionStatusEnum {
  ///Enum that represent Status is good.
  ok,

  ///Enum that represent Status is normal.
  normal,

  ///Enum that represent Status is slow.
  slow,

  ///Enum that represent Status is error.
  error
}
