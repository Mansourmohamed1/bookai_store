class AuthState {}

class AuthCubitInitial extends AuthState {}

class AuthCubitLoading extends AuthState {}

class AuthCubitSuccess extends AuthState {}

class AuthCubitError extends AuthState {
  final String message;
  AuthCubitError(this.message);
}
