import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logistic_app/Feuthers/auth/model/sign_in_response/sign_in_response.dart';

part 'employee_cubit.freezed.dart';
part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(const EmployeeState.initial());
}
