import 'package:clean_nest/core/entities/user.dart';

abstract class AuthRepository {
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
  Future<User> login(String email, String password);
  Future<void> logout();
  Future<User?> getCurrentUser();
}
