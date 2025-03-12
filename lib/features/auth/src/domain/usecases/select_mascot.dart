import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class SelectMascotUsecase {
  Future<Either<Failure, void>> call(Mascot mascot, User user);
}

@Injectable(as: SelectMascotUsecase)
class SelectMascot implements SelectMascotUsecase {
  @override
  Future<Either<Failure, void>> call(Mascot mascot, User user) async {
    user.copyWith(mascot: mascot);
    return right(null);
  }
}
