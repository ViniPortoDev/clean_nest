import 'package:clean_nest/core/entities/group.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/modules/auth/src/data/models/mascot_model.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
    required super.mascot,
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
      mascot: MascotModel.fromMap(json['mascot']),
      groups:
          List<Group>.from(json['groups'].map((group) => Group.fromMap(group))),
    );
  }
}
