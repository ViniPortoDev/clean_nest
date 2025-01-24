// lib/modules/auth/src/domain/repositories/user_repository.dart

import 'package:clean_nest/core/domain/entities/group.dart';
import 'package:clean_nest/core/domain/entities/user.dart';

abstract class UserRepository {
  Future<void> createGroup(Group group);
  // Future<void> createUser(String name, String email, String password);
  Future<User?> getUser();
}
