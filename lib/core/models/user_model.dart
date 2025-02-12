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
      'groups': groups,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      mascot:
          json['mascot'] != null ? MascotModel.fromMap(json['mascot']) : null,
      groups: List<GroupModel>.from(
          json['groups'].map((group) => GroupModel.fromMap(group))),
    );
  }
}
