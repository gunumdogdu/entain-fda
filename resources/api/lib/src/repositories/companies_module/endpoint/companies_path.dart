// ignore_for_file: sort_constructors_first

enum CompaniesServicePath {
  companies('partner-svc/companies'),
  ;

  final String value;

  const CompaniesServicePath(this.value);

  String withPath(String value) {
    return '${this.value}/$value';
  }
}
