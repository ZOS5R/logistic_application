import 'package:dio/dio.dart';
import 'package:logistic_app/Feuthers/auth/data/api/auth_api_service.dart';
import 'package:logistic_app/Feuthers/auth/model/sign_in_request/sign_in_request.dart';
import 'package:logistic_app/Feuthers/auth/model/sign_in_response/sign_in_response.dart';
import 'package:logistic_app/core/api/api_result.dart';

class SignInRepository {
  final AuthApiService _apiService;
  SignInRepository(this._apiService);

  Future<ApiResult<SignInResponse>> signIn(SignInRequest requestModel) async {
    try {
      final result = await _apiService.signIn(FormData.fromMap({
        'email': requestModel.email,
      }));
      if (result.status == true) {
        return ApiResult.success(result);
      } else {
        return ApiResult.failure(result.message);
      }
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
