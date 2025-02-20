import 'package:clean_nest/core/entities/mascot.dart';

class MascotModel extends Mascot {
  MascotModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory MascotModel.fromMap(Map<String, dynamic> map) {
    return MascotModel(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
    );
  }
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
