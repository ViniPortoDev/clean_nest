// lib/modules/auth/src/ui/viewmodels/choose_mascot_viewmodel.dart
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/choose_mascot_repository.dart';
import 'package:clean_nest/modules/auth/src/domain/entities/mascot_entity.dart';
import 'package:flutter/material.dart';

class SetupProfileViewModel extends BaseViewModel {
  final ChooseMascotRepository chooseMascotrepository;

  SetupProfileViewModel(this.chooseMascotrepository);
  Mascot? selectedMascot;

  List<Mascot> mascots = [];

  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

  int get currentPageIndex => pageIndexNotifier.value;

  // Controlador para o nome do grupo
  TextEditingController groupNameController = TextEditingController();

  User? _user;

  User? get user => _user;

  Future<void> createGroup() async {
    if (_user != null) {
      final groupName = groupNameController.text;
      if (groupName.isNotEmpty) {

        // await createGroupUsecase.call(_user!, newGroup);

        notifyListeners();
      }
    }
  }

  // Função para atualizar o índice da página
  void setPageIndex(int index) {
    if (pageIndexNotifier.value != index) {
      pageIndexNotifier.value = index;
    }
  }

  void loadMascots() {
    setLoading(true);
    try {
      mascots = chooseMascotrepository.fetchMascots();
    } catch (e) {
      mascots = [];
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  void selectMascot(Mascot mascot) {
    selectedMascot = mascot;
    notifyListeners();
  }
}
