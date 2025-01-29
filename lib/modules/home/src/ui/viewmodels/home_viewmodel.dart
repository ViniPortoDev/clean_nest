import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';

class HomeViewmodel extends BaseViewModel {

  HomeViewmodel();

  User? _user;

  User? get user => _user;

  
}
