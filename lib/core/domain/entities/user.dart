import 'package:clean_nest/core/domain/entities/group.dart';

class User {
  final int id;
  final String name;
  final String email;
  // final Mascot? mascot;
  final List<Group> groups;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.groups,
  });
}
