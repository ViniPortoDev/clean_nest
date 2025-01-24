// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clean_nest/core/domain/entities/group.dart';

class UserModel {
  final int id;
  final String email;
  final String name;
  final String password;
  // final Mascot? mascot;
  final List<Group> groups;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
    required this.groups,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'password': password,
      'groups': groups.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      email: map['email'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      groups: List<Group>.from(
        (map['groups'] as List<int>).map<Group>(
          (x) => Group.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
