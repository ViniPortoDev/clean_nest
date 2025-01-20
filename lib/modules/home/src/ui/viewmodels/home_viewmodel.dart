import 'package:clean_nest/core/domain/entities/group.dart';
import 'package:clean_nest/core/domain/entities/user.dart';
import 'package:clean_nest/core/domain/repositories/user_repository.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';

class HomeViewmodel extends BaseViewModel {
  final UserRepository _userRepository;

  HomeViewmodel(this._userRepository);

  User? _user;

  User? get user => _user;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
  }
}
