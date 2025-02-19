// lib/modules/auth/src/ui/viewmodels/choose_mascot_viewmodel.dart
import 'package:clean_nest/core/entities/group.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/services/error_handling_service.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/choose_mascot_repository.dart';
import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/get_current_user.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/update_user.dart';
import 'package:flutter/material.dart';

class SetupProfileViewModel extends BaseViewModel {
  final ChooseMascotRepository chooseMascotrepository;
  final GetCurrentUserUsecase getCurrentUserUsecase;
  final UpdateUserUsecase updateUserUsecase;

  SetupProfileViewModel(
    this.chooseMascotrepository,
    this.getCurrentUserUsecase,
    this.updateUserUsecase,
  );

  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

  TextEditingController groupNameController = TextEditingController();

  User? _user;
  User? get user => _user;

  List<Mascot> mascots = [];

  Mascot? selectedMascot;

  ValueNotifier<String?> messageNotifier = ValueNotifier<String?>(null);

  void setPageIndex(int index) {
    if (pageIndexNotifier.value != index) {
      pageIndexNotifier.value = index;
    }
  }

  // carrega os mascots mockados
  void loadMascots() {
    setLoading(true);
    try {
      mascots = chooseMascotrepository.fetchMascots();
    } catch (e) {
      mascots = [];
      // Passa a mensagem de erro para a UI
      messageNotifier.value = "Erro ao carregar mascotes";
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  //carrega o usuario atual
  Future<void> getCurrentUser() async {
    setLoading(true);
    try {
      final result = await getCurrentUserUsecase.call();
      result.fold(
        (error) {
          _user = null;
          // Aqui você pode tratar erros de forma mais detalhada
          messageNotifier.value = ErrorHandlingService.handleError(error);
        },
        (user) {
          _user = user;
        },
      );
    } finally {
      setLoading(false);
    }
  }

  //seleciona o mascote
  void selectMascot(Mascot mascot) {
    setLoading(true);
    selectedMascot = mascot;

    if (_user != null) {
      final updatedUser = _user!.copyWith(mascot: mascot);

      _user = updatedUser;
    }
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

  //atualiza o usuario
  Future<void> updateUser() async {
    setLoading(true);

    if (_user != null) {
      final result = await updateUserUsecase.call(_user!);
      result.fold(
          (error) =>
              messageNotifier.value = ErrorHandlingService.handleError(error),
          (success) => messageNotifier.value = "Usuário configuradinho");
    }
    setLoading(false);
  }
}
