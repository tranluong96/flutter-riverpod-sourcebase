abstract interface class AuthRepository {
  bool get hasSession;

  Future<void> logout();
}
