import 'package:clean_nest/core/domain/entities/group.dart';
import 'package:clean_nest/core/domain/entities/user.dart';

class UserFactory {
  /// Cria um usuário validando os dados de entrada
  static User createUser({
    required int id,
    required String name,
    required String email,
    List<Group> groups = const [],
  }) {
    if (name.isEmpty) {
      throw ArgumentError('O nome do usuário não pode ser vazio.');
    }
    if (!email.contains('@')) {
      throw ArgumentError('O e-mail informado é inválido.');
    }

    return User(
      id: id,
      name: name,
      email: email,
      groups: groups,
    );
  }
}
