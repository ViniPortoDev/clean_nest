import 'package:flutter/material.dart';

class TaskViewModel extends ChangeNotifier {
  String? _type;
  String? _group;
  String? _category;
  List<String> _participants = [];

  String? get type => _type;
  String? get group => _group;
  String? get category => _category;
  List<String> get participants => _participants;

  void setType(String value) {
    _type = value;
    notifyListeners();
  }

  void setGroup(String value) {
    _group = value;
    notifyListeners();
  }

  void setCategory(String value) {
    _category = value;
    notifyListeners();
  }

  void setParticipants(List<String> participants) {
    _participants = participants;
    notifyListeners();
  }

  void addParticipant(String participant) {
    _participants.add(participant);
    notifyListeners();
  }

  void removeParticipant(String participant) {
    _participants.remove(participant);
    notifyListeners();
  }

  bool canAddTask() {
    return _type != null && _group != null && _category != null && _participants.isNotEmpty;
  }
}
