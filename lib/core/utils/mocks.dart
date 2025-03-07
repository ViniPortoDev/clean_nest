import 'package:clean_nest/core/entities/mascot.dart';

class Mocks {
  static final Map<String, dynamic> currentUser = {
    'id': '1', // ID mockado
    'name': 'Vinicius Porto',
    'email': 'vinicius.p.a.corin@gmail.com',
    'password': '123',
    'groups': [],
  };

  static final List<Mascot> mascots = [
    Mascot(
      id: 1,
      name: 'Mascote 1',
      imageUrl: 'assets/images/logo_elizeu.png',
    ),
    Mascot(
      id: 2,
      name: 'Mascote 2',
      imageUrl: 'assets/images/logo_elizeu.png',
    ),
    Mascot(
      id: 3,
      name: 'Mascote 3',
      imageUrl: 'assets/images/logo_elizeu.png',
    ),
    Mascot(
      id: 4,
      name: 'Mascote 4',
      imageUrl: 'assets/images/logo_elizeu.png',
    ),
    Mascot(
      id: 5,
      name: 'Mascote 5',
      imageUrl: 'assets/images/logo_elizeu.png',
    ),
    Mascot(
      id: 6,
      name: 'Mascote 6',
      imageUrl: 'assets/images/logo_elizeu.png',
    ),
  ];
}
