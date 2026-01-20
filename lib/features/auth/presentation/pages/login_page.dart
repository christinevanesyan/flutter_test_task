import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_task/core/constants/app_colors.dart';
import 'package:flutter_test_task/core/utils/validators.dart';
import 'package:flutter_test_task/core/widgets/primary_button.dart';
import 'package:flutter_test_task/core/widgets/scaffold_widget.dart';
import 'package:flutter_test_task/core/widgets/title_header.dart';
import 'package:flutter_test_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_test_task/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_test_task/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_test_task/features/auth/presentation/pages/registration_page.dart';
import 'package:flutter_test_task/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test_task/features/gallery/presentation/pages/gallery_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthBloc get _bloc => context.read<AuthBloc>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const GalleryPage()),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: ScaffoldWidget(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleHeader(
                          title: l10n.login,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: l10n.email,
                          placeholder: l10n.emailPlaceholder,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.enterEmail;
                            }
                            if (!Validators.isValidEmail(value.trim())) {
                              return l10n.enterValidEmail;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: l10n.passwordConfirmation,
                          placeholder: l10n.passwordPlaceholder,
                          controller: _passwordController,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.enterPassword;
                            }
                            if (!Validators.isValidPassword(value)) {
                              return l10n.passwordLengthError;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return PrimaryButton(
                            text: l10n.loginButton,
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                _bloc.add(LoginEvent(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                ));
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      PrimaryButton(
                        text: l10n.registrationButton,
                        backgroundColor: AppColors.white,
                        textColor: AppColors.background,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const RegistrationPage()),
                          );
                        },
                      ),
                      const SizedBox(height: kBottomNavigationBarHeight)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
