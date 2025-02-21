import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/user/domain/usecases/get_current_user.dart';
import 'package:clean_nest/core/user/domain/usecases/save_user.dart';
import 'package:clean_nest/modules/auth/src/domain/errors/auth_errors.dart';
import 'package:dartz/dartz.dart';

abstract class SelectMascotUsecase {
  Future<Either<Failure, void>> call(Mascot mascot);
}

class SelectMascot implements SelectMascotUsecase {
  final SaveUser saveUser;
  final GetCurrentUser getCurrentUser;

  SelectMascot(this.saveUser, this.getCurrentUser);

  @override
  Future<Either<Failure, void>> call(Mascot mascot) async {
    final result = await getCurrentUser.call();

    return await result.fold(
      (failure) => Left(failure),
      (currentUser) async {
        if (currentUser == null) {
          return Left(UserNotFound());
        } else {
          final saveResult =
              await saveUser.call(currentUser.copyWith(mascot: mascot));

          return saveResult.fold(
            (saveFailure) => Left(saveFailure),
            (_) => right(null),
          );
        }
      },
    );
  }
}
