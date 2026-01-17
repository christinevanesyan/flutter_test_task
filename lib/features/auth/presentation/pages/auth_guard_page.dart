import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_task/core/constants/app_colors.dart';
import 'package:flutter_test_task/core/widgets/scaffold_widget.dart';
import 'package:flutter_test_task/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:flutter_test_task/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_test_task/features/gallery/presentation/pages/gallery_page.dart';

class AuthGuardPage extends StatelessWidget {
  const AuthGuardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authDataSource = FirebaseAuthDataSource();

    return StreamBuilder<User?>(
      stream: authDataSource.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ScaffoldWidget(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
              ),
            ),
          );
        }

        if (snapshot.hasData && snapshot.data != null) {
          return const GalleryPage();
        }

        return const LoginPage();
      },
    );
  }
}
