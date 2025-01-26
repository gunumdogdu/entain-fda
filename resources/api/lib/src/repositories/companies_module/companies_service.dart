import 'package:api/src/repositories/companies_module/index.dart';
import 'package:api/src/repositories/service/client/index.dart';
import 'package:api/src/repositories/service/dio_service.dart';

///Class that handles all Auth Module requests.
class CompaniesService extends BaseClient {
  ///Class that handles all Auth Module requests.
  CompaniesService({
    required this.dioClient,
  }) : super(dio: dioClient);

  ///Client to use in requests
  final DioClient dioClient;

  /// Get current user
  Future<BaseHttpModel<CompaniesResponseModel>> getCompanies(
    CompaniesRequestModel requestModel,
  ) async {
    return baseRequest<CompaniesResponseModel, CompaniesResponseModel>(
      responseModel: CompaniesResponseModel(),
      httpUrl: CompaniesServicePath.companies.value,
      method: DioHttpMethod.get,
      queryParams: requestModel.toJson(),
      
    );
  }
}
