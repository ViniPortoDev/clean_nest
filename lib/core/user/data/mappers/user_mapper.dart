import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/models/user_model.dart';

extension UserMapper on User {
  /// Converte a entidade [User] (domínio) para [UserModel] (dados).
  UserModel toModel() {
    return UserModel(
      id: id,
      name: name,
      email: email,
      password: password,
      groups: groups,
    );
  }
}

extension UserModelMapper on UserModel {
  /// Converte o modelo [UserModel] (dados) para a entidade [User] (domínio).
  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      password: password,
      groups: groups,
    );
  }
}
