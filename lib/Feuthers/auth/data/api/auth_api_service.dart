import 'package:dio/dio.dart';
import 'package:logistic_app/Feuthers/auth/data/api/api_const.dart';
import 'package:logistic_app/Feuthers/auth/model/sign_in_response/sign_in_response.dart';
import 'package:logistic_app/core/api/api_const.dart';
import 'package:retrofit/retrofit.dart'; // Make sure to include this import for Retrofit

// Make sure you have the correct part directive for code generation
part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConst.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) =
      _AuthApiService; // Use _AuthApiService for the generated code

  @POST(SignInApiConst.signIn)
  Future<SignInResponse> signIn(@Body() FormData signInRequest);
}
