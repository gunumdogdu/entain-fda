import 'package:api/src/repositories/service/client/index.dart';

///Extension to generically send request and handle error
extension BaseRequestExtension<T> on Future<BaseHttpModel<T>> {
  Future<T> handleRequest({
    String? defaultErrorMessage,
    List<BaseModelStatus?>? skipExceptionCode,
    void Function(BaseModelStatus?)? onSkip,
    void Function(T?)? onSuccess,
    void Function(BaseErrorModel?)? onIgnoreException,
    bool ignoreException = false,
    T? defaultResponse,
  }) async {
    assert(
      skipExceptionCode == null || defaultResponse != null,
      'If skipExceptionCodes is not null, defaultResponse cannot be null.',
    );

    assert(
      !ignoreException || defaultResponse != null,
      'If ignoreException is true, defaultResponse cannot be null.',
    );

    assert(
      onSkip == null || skipExceptionCode != null,
      'If onSkip is not null, skipExceptionCodes cannot be null.',
    );

    assert(
      onIgnoreException == null || ignoreException == true,
      'If onIgnoreException is not null, ignoreException cannot be false.',
    );

    final response = await this;
    if (response.status.isOk) {
      onSuccess?.call(response.data as T);
      return response.data as T;
    } else if (skipExceptionCode != null &&
        skipExceptionCode.contains(response.status)) {
      onSkip?.call(response.status);
      return defaultResponse!;
    } else {
      if (ignoreException) {
        onIgnoreException?.call(response.error);
        return defaultResponse!;
      }
      throw AppException(response.error?.message ?? defaultErrorMessage);
    }
  }
}
