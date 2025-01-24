import 'package:clean_nest/core/domain/entities/user.dart';


abstract class AuthRepository {
  Future<void> login(User user);
  // Future<User?> getLoggedUser();
  Future<User> createUser();
  Future<void> logout();
}
