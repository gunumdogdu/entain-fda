/// Enum for API endpoints
enum ApiPath {
  /// Get current user endpoint
  getCurrentUser('/auth/me'),

  /// Verify user endpoint
  verifyUser('/auth/verify');

  /// Constructor
  const ApiPath(this.path);

  /// Path of the endpoint
  final String path;
}
