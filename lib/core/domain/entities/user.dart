import 'package:clean_nest/core/domain/entities/group.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String password;
  // final Mascot? mascot;
  final List<Group> groups;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.groups,
  });

  
}
