import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/core/entities/user.dart';

abstract class SetupProfileRepository {
  Future<void> updateMascot(Mascot mascot);
  Future<void> createGroup(User user);
}
