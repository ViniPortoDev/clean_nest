// ignore_for_file: public_member_api_docs, sort_constructors_first
class Mascot {
  final int id;
  final String name;
  final String imageUrl;

  Mascot({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  Mascot copyWith({
    int? id,
    String? name,
    String? imageUrl,
  }) {
    return Mascot(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
