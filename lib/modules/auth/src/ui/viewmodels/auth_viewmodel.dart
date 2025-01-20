import 'package:clean_nest/core/domain/entities/user.dart';
import 'package:clean_nest/core/domain/repositories/user_repository.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';

class AuthViewmodel extends BaseViewModel {
  final UserRepository userRepository;

  AuthViewmodel({required this.userRepository});

  User? _user;

  User? get user => _user;

  Future<User?> getUser() async {
    _user = await userRepository.getUser();
    return _user;
  }
}
