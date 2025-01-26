// ignore_for_file: sort_constructors_first

enum AuthServicePath {
  login('partner-svc/auth/login'),
  getCurrentUser('partner-svc/auth/user'),
  verification('partner-svc/auth/verification');


  final String value;

  const AuthServicePath(this.value);

  String withPath(String value) {
    return '${this.value}/$value';
  }
}
