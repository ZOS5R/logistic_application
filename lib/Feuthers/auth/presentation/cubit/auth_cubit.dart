import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logistic_app/Feuthers/auth/data/repo/repo.dart';
import 'package:logistic_app/Feuthers/auth/model/sign_in_request/sign_in_request.dart';
import 'package:logistic_app/Feuthers/auth/model/sign_in_response/sign_in_response.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _signInRepository;
  AuthCubit(this._signInRepository) : super(const AuthState.initial());

  signIn(SignInRequest singInRequest) async {
    emit(const AuthState.loading());

    final result = await _signInRepository.signIn(singInRequest);
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
