import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_task/core/utils/validators.dart';
import 'package:flutter_test_task/core/widgets/primary_button.dart';
import 'package:flutter_test_task/core/widgets/scaffold_widget.dart';
import 'package:flutter_test_task/core/widgets/title_header.dart';
import 'package:flutter_test_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_test_task/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_test_task/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_test_task/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test_task/features/gallery/presentation/pages/gallery_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  AuthBloc get _bloc => context.read<AuthBloc>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleHeader(
                          title: l10n.registration,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: l10n.name,
                          placeholder: l10n.namePlaceholder,
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.enterName;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: l10n.email,
                          placeholder: l10n.emailPlaceholderReg,
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
                          label: l10n.password,
                          placeholder: l10n.passwordLength,
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
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: l10n.passwordConfirmation,
                          placeholder: l10n.passwordLength,
                          controller: _confirmPasswordController,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.confirmPassword;
                            }
                            if (value != _passwordController.text) {
                              return l10n.passwordMismatch;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          text: l10n.registerButton,
                          onPressed: () {
                            if ((_formKey.currentState?.validate() ?? false)) {
                              _bloc.add(RegisterEvent(
                                email: _emailController.text.trim(),
                                password: _passwordController.text,
                                displayName: _nameController.text.trim(),
                              ));
                            }
                          },
                        );
                      },
                    ),
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
