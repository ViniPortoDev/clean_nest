// lib/modules/auth/src/domain/usecases/create_group_usecase.dart

import 'package:clean_nest/core/domain/entities/group.dart';
import 'package:clean_nest/core/domain/entities/user.dart';
import 'package:clean_nest/core/domain/repositories/user_repository.dart';

abstract class CreateGroupUsecase {
  Future<void> call(User user, Group group);
}

class CreateGroup implements CreateGroupUsecase {
  final UserRepository userRepository;

  CreateGroup({required this.userRepository});

  @override
  Future<void> call(User user, Group group) async {
    // Atualiza a entidade User com o novo grupo
    user.groups.add(group);

    // Persiste o novo estado do usuário
    await userRepository.createGroup(group);
  }
}
