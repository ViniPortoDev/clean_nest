import 'package:clean_nest/core/domain/entities/group.dart';

abstract class GroupRepository {
  List<Group> getAllGroups();
  void addGroup(Group group);
}
