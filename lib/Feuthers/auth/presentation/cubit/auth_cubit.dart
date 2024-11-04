import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logistic_app/Feuthers/auth/data/api/auth_api_service.dart';
import 'package:logistic_app/Feuthers/auth/data/repo/repo.dart';
import 'package:logistic_app/Feuthers/auth/model/sign_in_request/sign_in_request.dart';
import 'package:logistic_app/Feuthers/auth/model/sign_in_response/sign_in_response.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthApiService _signInApiService;
  AuthCubit(this._signInApiService) : super(const AuthState.initial());

  signIn(SignInRequest singInRequest) async {
    emit(const AuthState.loading());

    SignInRepository signInRepository = SignInRepository(_signInApiService);
    final result = await signInRepository.signIn(singInRequest);
    result.when(
      success: (signInResponse) {
        emit(AuthState.success(signInResponse));
      },
      failure: (message) {
        emit(AuthState.failure(message));
      },
    );
  }
}
