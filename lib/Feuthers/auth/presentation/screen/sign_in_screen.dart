import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistic_app/Feuthers/auth/presentation/cubit/auth_cubit.dart';
import 'package:logistic_app/Feuthers/auth/presentation/widgets/sign_in_form_fields.dart';
import 'package:logistic_app/Feuthers/auth/presentation/widgets/sign_in_subtitle.dart';
import 'package:logistic_app/Feuthers/auth/presentation/widgets/sign_in_title.dart';
import 'package:logistic_app/core/di/di.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SignInTitle(),
            SizedBox(height: 10.h),
            const SignInSubtitle(),
            SizedBox(height: 24.h),
            BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: const SignInFormFields(),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
