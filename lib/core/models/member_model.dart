import 'package:clean_nest/core/entities/member.dart';

class MemberModel extends Member {
  MemberModel({
    required super.id,
    required super.name,
    required super.email,
    required super.mascot,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mascot': mascot,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> json) {
    return MemberModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mascot: json['mascot'],
    );
  }
}
