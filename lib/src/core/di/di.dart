import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/auth/data/repository/auth_repository.dart';
import '../../app/auth/presentation/provider/auth_provider.dart';
import '../../app/auth/presentation/provider/auth_state.dart';
import '../provider/theme_provider.dart';
import '../theme/app_theme.dart';

// Providers
final authProvider = StateNotifierProvider<AuthProvider, AuthState>(
  (ref) => AuthProvider(
    authRepository: ref.read(authRepoProvider),
  ),
);

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeOptions>(
  (ref) => ThemeProvider(
    sharedPreferences: ref.read(sharedPreferencedProvider).value,
  ),
);

// Repositories
final authRepoProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    firebaseAuth: ref.read(firebaseAuthProvider),
    firebaseFirestore: ref.read(firebaseFireStoreProvider),
  ),
);

// Externals
final firebaseFireStoreProvider = Provider<FirebaseFirestore>(
  (_) => FirebaseFirestore.instance,
);

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (_) => FirebaseAuth.instance,
);

final sharedPreferencedProvider = FutureProvider<SharedPreferences>((_) {
  return SharedPreferences.getInstance();
});
