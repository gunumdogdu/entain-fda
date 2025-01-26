import 'package:dio/dio.dart';

/// Base repository class that provides common functionality
abstract class BaseRepository {
  /// Constructor that takes a Dio instance
  BaseRepository({required this.dio});

  /// Dio instance for making HTTP requests
  final Dio dio;
}
