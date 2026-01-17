import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_task/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:flutter_test_task/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_test_task/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthDataSource authDataSource;

  AuthBloc({required this.authDataSource}) : super(const AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
  }

  Future<void> _onLogin(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final user = await authDataSource.signIn(
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
      final user = await authDataSource.register(
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
      await authDataSource.signOut();
      emit(const AuthLogoutSuccess());
    } catch (e) {
      emit(AuthError('Logout failed: $e'));
    }
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    final user = authDataSource.currentUser;

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
