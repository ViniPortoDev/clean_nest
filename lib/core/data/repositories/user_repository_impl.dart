// lib/modules/auth/src/data/repositories/user_repository_impl.dart

import 'package:clean_nest/core/domain/entities/group.dart';
import 'package:clean_nest/core/domain/entities/user.dart';
import 'package:clean_nest/core/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  //TODO dados mockados de um suposto local storage
  final User _user = User(
    id: DateTime.now().millisecondsSinceEpoch,
    name: 'Vinicius',
    email: 'vinicius.p.a.corin@gmail.com',
    groups: [],
  );

  @override
  Future<void> createGroup(Group newGroup) async {
    _user.groups.add(newGroup);
    // Simule persistência de dados (local storage, database, etc.)
  }

  @override
  Future<User?> getUser() async {
    return _user; // Retorna o usuário com os dados persistidos
  }
}
