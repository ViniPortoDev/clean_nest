import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/modules/auth/src/data/datasources/auth_local_datasource.dart';
import 'package:clean_nest/core/models/user_model.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/setup_profile_repository.dart';

class SetupProfileRepositoryImpl implements SetupProfileRepository {
  final AuthLocalDatasource authLocalDatasource;

  SetupProfileRepositoryImpl(this.authLocalDatasource);
  @override
  Future<void> updateMascot(Mascot mascot) async {
     UserModel? currentUser = await authLocalDatasource.getCurrentUser();
    if (currentUser != null) {
      await authLocalDatasource.saveUser(currentUser.toMap());
    }
  }

  @override
  Future<void> createGroup(User user) {
    // TODO: implement createGroup
    throw UnimplementedError();
  }
}
