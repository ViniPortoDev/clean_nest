// lib/modules/auth/src/ui/viewmodels/choose_mascot_viewmodel.dart
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/choose_mascot_repository.dart';
import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/get_current_user.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/update_user.dart';
import 'package:flutter/material.dart';

class SetupProfileViewModel extends BaseViewModel {
  final ChooseMascotRepository chooseMascotrepository;
  final GetCurrentUserUsecase getCurrentUserUsecase;
  final UpdateUser updateUserUsecase;

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

  void setPageIndex(int index) {
    if (pageIndexNotifier.value != index) {
      pageIndexNotifier.value = index;
    }
  }

  Future<void> selectMascot(Mascot mascot) async {
    setLoading(true);

    if (_user != null) {
      final updatedUser = _user!.copyWith(
        mascot: mascot,
      );
      await updateUserUsecase.call(updatedUser);
    }
    setLoading(false);
  }

  Future<void> loadUser() async {
    setLoading(true);
    try {
      _user = await getCurrentUserUsecase.call();
    } catch (e) {
      _user = null;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> createGroup() async {
    if (_user != null) {
      final groupName = groupNameController.text;
      if (groupName.isNotEmpty) {
        notifyListeners();
      }
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
}
