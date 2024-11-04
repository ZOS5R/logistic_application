import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistic_app/core/di/di.dart';
import 'package:logistic_app/core/manger/manager_cubit.dart';
import 'package:logistic_app/core/manger/manager_state.dart';
import 'package:logistic_app/core/router/router.dart';
import 'package:logistic_app/core/services/notifications/notification_service.dart';
import 'package:logistic_app/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await NotificationServices.initializeNotification();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await setupService();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', "US"),
        Locale('ar', "AE"),
        Locale('zh', 'Hant'),
        Locale('zh', 'Hans'),
        Locale('id', 'ID'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', "US"),
      startLocale: const Locale('en', "US"),
      child: const MyApp(),
    ),
  );
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return BlocProvider(
      create: (_) => ManagerCubit(),
      child: ScreenUtilInit(
        designSize: const Size(411, 823),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ManagerCubit, ManagerState>(
            builder: (context, state) {
              return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: state.themeMode == ThemeMode.light
                      ? AppTheme.lightTheme
                      : AppTheme.darkTheme,
                  routerConfig: GoRouterApp.router,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: state.languageCode);
            },
          );
        },
      ),
    );
  }
}
