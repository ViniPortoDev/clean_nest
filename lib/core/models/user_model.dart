import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/modules/auth/src/data/models/group_model.dart';
import 'package:clean_nest/modules/auth/src/data/models/mascot_model.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
    super.mascot,
    required super.groups,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'mascot': mascot != null
          ? MascotModel(
                  id: mascot!.id,
                  name: mascot!.name,
                  imageUrl: mascot!.imageUrl)
              .toMap()
          : null,
      'groups':
          groups.map((group) => GroupModel.fromEntity(group).toMap()).toList(),
    };
  }

  //TODO criptografar o password

  // String encryptPassword(String password) {
  //   var bytes = utf8.encode(password);
  //   var digest = sha256.convert(bytes); // Exemplo usando SHA-256
  //   return digest.toString();
  // }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      mascot:
          json['mascot'] != null ? MascotModel.fromMap(json['mascot']) : null,
      groups: json['groups'] != null
          ? List<GroupModel>.from((json['groups'] as List)
              .map((group) => GroupModel.fromMap(group)))
          : [],
    );
  }
}
