import 'group.dart';
import 'mascot.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final Mascot? mascot; // Mascot pode ser nulo até ser escolhido
  final List<Group> groups;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.mascot,
    required this.groups,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    Mascot? mascot,
    List<Group>? groups,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      mascot: mascot ?? this.mascot,
      groups: groups ?? this.groups,
    );
  }
}
