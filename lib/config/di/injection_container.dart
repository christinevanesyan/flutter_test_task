import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test_task/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:flutter_test_task/features/new_image/data/services/firebase_storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseAuthDataSource>(
      () => FirebaseAuthDataSource(firebaseAuth: getIt()));
  getIt.registerLazySingleton<FirebaseStorageService>(
      () => FirebaseStorageService());
}
