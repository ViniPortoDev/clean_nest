// lib/modules/auth/src/ui/viewmodels/choose_mascot_viewmodel.dart
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/choose_mascot_repository.dart';
import 'package:clean_nest/modules/auth/src/domain/entities/mascot_entity.dart';
import 'package:flutter/material.dart';

class SetupProfileViewModel extends BaseViewModel {
  final ChooseMascotRepository repository;
  List<Mascot> mascots = [];
  Mascot? selectedMascot;

  SetupProfileViewModel(this.repository);

   final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

  int get currentPageIndex => pageIndexNotifier.value;

  // Função para atualizar o índice da página
  void setPageIndex(int index) {
    if (pageIndexNotifier.value != index) {
      pageIndexNotifier.value = index;
    }
  }

  void loadMascots() {
    setLoading(true);
    try {
      mascots = repository.fetchMascots();
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
