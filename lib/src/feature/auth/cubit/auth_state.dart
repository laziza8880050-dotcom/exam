class AuthState {
  final AuthStatus status;

  AuthState({
    this.status =  AuthStatus.intial
  });
}
enum AuthStatus{
  intial, loading, error, loaded
}
