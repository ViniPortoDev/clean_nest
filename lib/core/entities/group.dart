// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Group {
  final int id;
  final String name;
  // final List<Member> membersList;
  // final List<Task> tasks;

  Group({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Group.fromJson(String source) => Group.fromMap(json.decode(source) as Map<String, dynamic>);
}
