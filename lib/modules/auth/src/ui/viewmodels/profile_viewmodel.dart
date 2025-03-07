import 'package:clean_nest/core/entities/group.dart';
import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/user/domain/usecases/save_user.dart';
import 'package:clean_nest/core/utils/mocks.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/core/user/domain/usecases/get_current_user.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends BaseViewModel {
  final GetCurrentUser getCurrentUser;
  final SaveUser saveUser;

  ProfileViewModel(this.getCurrentUser, this.saveUser);

  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);
  TextEditingController groupNameController = TextEditingController();
  List<Mascot> mascots = [];
  Mascot? selectedMascot;
  ValueNotifier<String?> messageNotifier = ValueNotifier<String?>(null);

  User? _user;

  // Define a página atual
  void setPageIndex(int index) {
    if (pageIndexNotifier.value != index) {
      pageIndexNotifier.value = index;
    }
  }

  // Carrega o usuário e os mascotes no initState
  Future<void> initialize() async {
    setLoading(true);

    final userResult = await getCurrentUser.call();
    userResult.fold(
      (error) {
        messageNotifier.value = "Erro ao obter usuário: ${error.message}";
      },
      (user) {
        _user = user;
        fetchMascots();
      },
    );

    setLoading(false);
  }

  // Carrega os mascotes
  void fetchMascots() {
    try {
      mascots = Mocks.mascots;
    } catch (e) {
      mascots = [];
      messageNotifier.value = "Erro ao carregar mascotes";
    } finally {
      notifyListeners();
    }
  }

  // Seleciona o mascote
  void selectMascot(Mascot mascot) async {
    setLoading(true);
    if (_user != null) {
      selectedMascot = mascot;
      _user = _user!.copyWith(mascot: mascot);
      messageNotifier.value = "Mascote ${mascot.name} selecionado!";
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

      _user = _user!.copyWith(groups: [..._user!.groups, newGroup]);
    }
    setLoading(false);
  }

  // Cria o grupo e atualiza o usuário
  Future<bool> updateProfile() async {
    setLoading(true);

    if (_user == null) return _fail("Erro: usuário não carregado");
    if (_user!.mascot == null) return _fail("Erro: mascote não selecionado");
    if (_user!.groups.isEmpty) return _fail("Erro: grupo não criado");

    final result = await saveUser.call(_user!);

    setLoading(false);
    return result.fold(
      (error) => _fail("Erro ao atualizar usuário: ${error.message}"),
      (_) {
        messageNotifier.value = "Usuário atualizado com sucesso!";
        return true;
      },
    );
  }

  bool _fail(String message) {
    messageNotifier.value = message;
    setLoading(false);
    return false;
  }
}
