// lib/modules/auth/src/ui/viewmodels/choose_mascot_viewmodel.dart
import 'package:clean_nest/core/entities/group.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/services/errors/network_error.dart';
import 'package:clean_nest/core/services/errors/storage_error.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/modules/auth/src/domain/errors/auth_errors.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/choose_mascot_repository.dart';
import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/get_current_user.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/update_user.dart';
import 'package:flutter/material.dart';
import 'package:clean_nest/core/errors/failure.dart';

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
  int get currentPageIndex => pageIndexNotifier.value;

  TextEditingController groupNameController = TextEditingController();

  User? _user;
  User? get user => _user;

  List<Mascot> mascots = [];

  Mascot? selectedMascot;

  // Estado de erro ou sucesso
  ValueNotifier<String?> messageNotifier = ValueNotifier<String?>(null);

  void setPageIndex(int index) {
    if (pageIndexNotifier.value != index) {
      pageIndexNotifier.value = index;
    }
  }

  Future<void> selectMascot(Mascot mascot) async {
    setLoading(true);
    selectedMascot = mascot;

    if (user != null) {
      final updatedUser = user!.copyWith(mascot: mascot);
      final result = await updateUserUsecase.call(updatedUser);
      result.fold(
        (error) {
          // Passa a mensagem de erro para a UI
          messageNotifier.value = _handleError(error);
        },
        (_) {
          // Passa a mensagem de sucesso para a UI
          messageNotifier.value = "Mascote selecionado com sucesso!";
        },
      );
    }
    setLoading(false);
  }

  Future<void> createGroup() async {
    setLoading(true);

    if (_user != null && groupNameController.text.isNotEmpty) {
      final newGroup = Group(
        id: DateTime.now().millisecondsSinceEpoch,
        name: groupNameController.text,
        members: [],
        tasks: [],
      );

      final updatedUser = _user!.copyWith(
        groups: [newGroup],
      );
      final result = await updateUserUsecase.call(updatedUser);
      result.fold(
        (error) {
          // Passa a mensagem de erro para a UI
          messageNotifier.value = _handleError(error);
        },
        (_) {
          // Passa a mensagem de sucesso para a UI
          messageNotifier.value = "Grupo criado com sucesso!";
        },
      );
    }
    setLoading(false);
  }

  Future<void> loadUser() async {
    setLoading(true);
    try {
      final result = await getCurrentUserUsecase.call();
      result.fold(
        (error) {
          _user = null;
          // Aqui você pode tratar erros de forma mais detalhada
          messageNotifier.value = _handleError(error);
        },
        (user) {
          _user = user;
        },
      );
    } finally {
      setLoading(false);
    }
  }

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

  String _handleError(Failure error) {
    // Tratar cada tipo de erro de forma específica
    if (error is StorageError) {
      return "Erro ao acessar os dados locais.";
    } else if (error is NetworkError) {
      return "Erro de conexão com a internet.";
    } else if (error is AuthError) {
      return "Erro de autenticação. Tente novamente.";
    }
    return "Erro desconhecido. Tente novamente mais tarde.";
  }
}
