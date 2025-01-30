import 'mascot.dart';

class Member {
  final int id;
  final String name;
  final String email;
  final Mascot? mascot; // Mascot pode ser nulo até ser escolhido

  Member({
    required this.id,
    required this.name,
    required this.email,
    this.mascot,
  });

  Member copyWith({
    int? id,
    String? name,
    String? email,
    Mascot? mascot,
  }) {
    return Member(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mascot: mascot ?? this.mascot,
    );
  }
}
