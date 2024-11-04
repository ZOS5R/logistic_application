part of 'employee_cubit.dart';

@freezed
class EmployeeState with _$EmployeeState {
  const factory EmployeeState.initial() = _Initial;
  const factory EmployeeState.loading() = _Loading;
  const factory EmployeeState.success(SignInResponse response) = _Success;
  const factory EmployeeState.failure(String message) = _Failure;
}
