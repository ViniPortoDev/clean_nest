// lib/modules/auth/src/domain/repositories/user_repository.dart

import 'package:clean_nest/core/domain/entities/group.dart';
import 'package:clean_nest/core/domain/entities/user.dart';

abstract class UserRepository {
  Future<void> createGroup(Group group); // Atualiza o nome do grupo
  Future<User?> getUser(); // Recupera os dados do usuário
}
