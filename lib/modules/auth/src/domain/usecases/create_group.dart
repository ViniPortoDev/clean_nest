import 'package:clean_nest/core/entities/group.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/user/domain/usecases/get_current_user.dart';
import 'package:clean_nest/core/user/domain/usecases/save_user.dart';
import 'package:clean_nest/modules/auth/src/domain/errors/auth_errors.dart';
import 'package:dartz/dartz.dart';

abstract class CreateGroupUsecase {
  Future<Either<Failure, void>> call(Group group);
}

class CreateGroup implements CreateGroupUsecase {
  final SaveUser saveUser;
  final GetCurrentUser getCurrentUser;

  CreateGroup(this.saveUser, this.getCurrentUser);

  @override
  Future<Either<Failure, void>> call(Group group) async {
    final result = await getCurrentUser.call();

    return result.fold(
      (failure) => Left(failure),
      (currentUser) {
        if (currentUser == null) {
          return Left(UserNotFound());
        }

        final updatedUser = currentUser.copyWith(
          groups: [...currentUser.groups, group],
        );

        return saveUser.call(updatedUser);
      },
    );
  }
}
