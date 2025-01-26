import 'package:api/src/repositories/auth_module/endpoint/auth_path.dart';
import 'package:api/src/repositories/auth_module/index.dart';
import 'package:api/src/repositories/service/client/index.dart';
import 'package:api/src/repositories/service/dio_service.dart';

///Class that handles all Auth Module requests.
class AuthService extends BaseClient {
  ///Class that handles all Auth Module requests.
  AuthService({
    required this.dioClient,
  }) : super(dio: dioClient);

  ///Client to use in requests
  final DioClient dioClient;

  /// Initialize login process with phone number
  Future<BaseHttpModel<LoginResponseModel>> login(
    LoginRequestModel requestModel,
  ) async {
    return baseRequest<LoginResponseModel, LoginResponseModel>(
      responseModel: LoginResponseModel(),
      httpUrl: AuthServicePath.login.value,
      method: DioHttpMethod.post,
      requestModel: requestModel,
    );
  }

  /// Verify OTP code
  Future<BaseHttpModel<VerificationResponseModel>> verify(
    VerificationRequestModel requestModel,
  ) async {
    return baseRequest<VerificationResponseModel, VerificationResponseModel>(
      responseModel: VerificationResponseModel(),
      httpUrl: AuthServicePath.verification.value,
      method: DioHttpMethod.post,
      requestModel: requestModel,
    );
  }

  /// Get current user
  Future<BaseHttpModel<VerificationResponseData>> getCurrentUser() async {
    return baseRequest<VerificationResponseData, VerificationResponseData>(
      responseModel: VerificationResponseData(),
      httpUrl: AuthServicePath.getCurrentUser.value,
      method: DioHttpMethod.get,
    );
  }
}
