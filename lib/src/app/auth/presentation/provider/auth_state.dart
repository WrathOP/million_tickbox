import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/user_model.dart';

part 'generated/auth_state.freezed.dart';

enum AuthStatus { idle, signingIn, gettingUser }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(null) UserModel? user,
  }) = _AuthState;
}
