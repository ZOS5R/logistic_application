import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logistic_app/Feuthers/auth/presentation/cubit/auth_cubit.dart';
import 'package:logistic_app/Feuthers/auth/presentation/screen/sign_in_screen.dart';
import 'package:logistic_app/Feuthers/driver/presentation/screens/driver_home_screen.dart';
import 'package:logistic_app/Feuthers/driver/presentation/screens/map_screen.dart';
import 'package:logistic_app/Feuthers/driver/presentation/screens/order_details_screen.dart';
import 'package:logistic_app/core/di/di.dart';
import 'package:logistic_app/core/router/rotue_names.dart';
import 'package:logistic_app/core/router/transaction.dart';

abstract class GoRouterApp {
  static bool isChecked = false;

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: RouteNames.signIn,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(
                child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<AuthCubit>()),
              ],
              child: const SignInScreen(),
            ));
          }),

      // DRiVER

      GoRoute(
          path: RouteNames.driverHome,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: const DriverHomeScreen());
          }),
      GoRoute(
          path: RouteNames.orderDetails,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: const OrderDetailsScreen());
          }),
      GoRoute(
          path: RouteNames.googleMap,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: const GoogleMapScreen());
          }),
    ],
  );
}
