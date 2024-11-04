import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistic_app/Feuthers/auth/presentation/cubit/auth_cubit.dart';
import 'package:logistic_app/core/widgets/buttons/loading_button.dart';
import 'package:logistic_app/core/widgets/snak_bar.dart';

class SignInButton extends StatelessWidget {
  final Future<dynamic>? Function()? onPressed;

  const SignInButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        debugPrint('state: $state');
        return state.maybeWhen(orElse: () {
          return LoadingButton(
            buttonText: 'Sign In',
            onPressed: onPressed,
            isLoading: false,
          );
        }, loading: () {
          return LoadingButton(
            buttonText: 'Sign In',
            onPressed: onPressed,
            isLoading: true,
          );
        }, success: (signInResponse) {
          Future.delayed(const Duration(microseconds: 100), () {
            // UserService.saveUser(signInResponse.user!);
            // return context.push(RouteNames.otpScreen, extra: signInResponse);
          });
          return LoadingButton(
            buttonText: 'Sign In',
            onPressed: onPressed,
            isLoading: false,
          );
        }, failure: (message) {
          SnackbarHelper.showSnackbar(
              context: context,
              title: 'error',
              content: message,
              state: SnackbarState.error);
          return LoadingButton(
            buttonText: 'Sign In',
            onPressed: onPressed,
            isLoading: false,
          );
        });
      },
    );
  }
}
