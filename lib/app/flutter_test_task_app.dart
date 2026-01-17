import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test_task/core/constants/app_fonts.dart';
import 'package:flutter_test_task/core/theme/app_typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test_task/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:flutter_test_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_test_task/features/auth/presentation/pages/login_page.dart';

class FlutterTestTaskApp extends StatelessWidget {
  const FlutterTestTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Test Task',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru', ''),
        ],
        locale: const Locale('ru', ''),
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: AppFonts.roboto,
          textTheme: const TextTheme(
              headlineLarge: AppTypography.headingRetro,
              bodyMedium: AppTypography.bodyRegular,
              titleMedium: AppTypography.subtitleMedium),
        ),
        home: BlocProvider(
          create: (context) => AuthBloc(
            authDataSource: FirebaseAuthDataSource(),
          ),
          child: const LoginPage(),
        ));
  }
}
