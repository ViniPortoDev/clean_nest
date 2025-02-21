// lib/modules/auth/src/ui/viewmodels/choose_mascot_viewmodel.dart
import 'package:clean_nest/core/entities/group.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/services/error_handling_service.dart';
import 'package:clean_nest/core/user/domain/usecases/get_current_user.dart';
import 'package:clean_nest/core/utils/mocks.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/create_group.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/select_mascot.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends BaseViewModel {
  final CreateGroupUsecase createGroupUsecase;
  final SelectMascotUsecase selectMascotUsecase;
  ProfileViewModel(this.createGroupUsecase, this.selectMascotUsecase);

  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

  TextEditingController groupNameController = TextEditingController();

  List<Mascot> mascots = [];

  Mascot? selectedMascot;

  ValueNotifier<String?> messageNotifier = ValueNotifier<String?>(null);

  // Define a página atual
  void setPageIndex(int index) {
    if (pageIndexNotifier.value != index) {
      pageIndexNotifier.value = index;
    }
  }

  // carrega os mascots
  void fetchMascots() {
    setLoading(true);
    try {
      mascots = Mocks.mascots;
    } catch (e) {
      mascots = [];
      messageNotifier.value = "Erro ao carregar mascotes";
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  //seleciona o mascote
  void selectMascot(Mascot mascot) async {
    setLoading(true);

    final result = await selectMascotUsecase.call(mascot);
    result.fold(
      (error) => messageNotifier.value = error.message,
      (_) {
        selectedMascot = mascot;
      },
    );
    setLoading(false);
  }

  //cria o grupo
  void createGroup() {
    setLoading(true);

    if (_user != null && groupNameController.text.isNotEmpty) {
      final newGroup = Group(
        id: DateTime.now().millisecondsSinceEpoch,
        name: groupNameController.text,
        members: [],
        tasks: [],
      );

      final updatedUser = _user!.copyWith(groups: [..._user!.groups, newGroup]);

      _user = updatedUser;
    }
    setLoading(false);
  }
}
