import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SelectMascotUsecase {
  Future<Either<Failure, void>> call(Mascot mascot, User user);
}

class SelectMascot implements SelectMascotUsecase {
  @override
  Future<Either<Failure, void>> call(Mascot mascot, User user) async {
    user.copyWith(mascot: mascot);
    return right(null);
  }
}
