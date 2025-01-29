import 'package:clean_nest/core/entities/group.dart';

abstract class GroupRepository {
  List<Group> getAllGroups();
  void addGroup(Group group);
}
