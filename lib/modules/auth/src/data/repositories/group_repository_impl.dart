import 'package:clean_nest/core/domain/entities/group.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/group_repository.dart';

class GroupRepositoryImpl implements GroupRepository {
  final List<Group> _groups = [];

  @override
  List<Group> getAllGroups() {
    return List.unmodifiable(_groups);
  }

  @override
  void addGroup(Group group) {
    _groups.add(group);
  }
}
