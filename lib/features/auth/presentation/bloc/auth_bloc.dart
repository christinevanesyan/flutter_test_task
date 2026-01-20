import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_task/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:flutter_test_task/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_test_task/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_test_task/core/extension/transform_extension.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthDataSource firebaseAuthDataSource;

  AuthBloc({required this.firebaseAuthDataSource})
      : super(const AuthInitial()) {
    on<LoginEvent>(_onLogin, transformer: debounce());
    on<RegisterEvent>(_onRegister, transformer: debounce());
    on<LogoutEvent>(_onLogout, transformer: debounce());
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
  }

  Future<void> _onLogin(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final user = await firebaseAuthDataSource.signIn(
        email: event.email,
        password: event.password,
      );

      emit(AuthAuthenticated(
        userId: user.uid,
        displayName: user.displayName,
        email: user.email,
      ));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Something went wrong'));
    } catch (e) {
      emit(AuthError('An unexpected error occurred: $e'));
    }
  }

  Future<void> _onRegister(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final user = await firebaseAuthDataSource.register(
        email: event.email,
        password: event.password,
        displayName: event.displayName,
      );

      emit(AuthAuthenticated(
        userId: user.uid,
        displayName: user.displayName,
        email: user.email,
      ));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Something went wrong'));
    } catch (e) {
      emit(AuthError('An unexpected error occurred: $e'));
    }
  }

  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      await firebaseAuthDataSource.signOut();
      emit(const AuthLogoutSuccess());
    } catch (e) {
      emit(AuthError('Logout failed: $e'));
    }
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    final user = firebaseAuthDataSource.currentUser;

    if (user != null) {
      emit(AuthAuthenticated(
        userId: user.uid,
        displayName: user.displayName,
        email: user.email,
      ));
    } else {
      emit(const AuthUnauthenticated());
    }
  }
}
