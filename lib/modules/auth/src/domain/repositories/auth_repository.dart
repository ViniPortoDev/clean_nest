import 'package:clean_nest/core/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  // Future<User?> getLoggedUser();
  Future<void> createUser(User user);
  Future<void> logout();
}
