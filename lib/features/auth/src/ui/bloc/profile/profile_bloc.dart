import 'package:clean_nest/core/entities/group.dart';
import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/core/user/domain/usecases/get_current_user.dart';
import 'package:clean_nest/core/user/domain/usecases/save_user.dart';
import 'package:clean_nest/core/utils/mocks.dart';
import 'package:clean_nest/features/auth/src/ui/bloc/profile/profile_event.dart';
import 'package:clean_nest/features/auth/src/ui/bloc/profile/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetCurrentUserUseCase _getCurrentUser;
  final SaveUserUseCase _saveUser;

  ProfileBloc({
    required GetCurrentUserUseCase getCurrentUser,
    required SaveUserUseCase saveUser,
  })  : _getCurrentUser = getCurrentUser,
        _saveUser = saveUser,
        super(const ProfileInitial()) {
    on<ProfileInitialize>(_onInitialize);
    on<ProfilePageChanged>(_onPageChanged);
    on<ProfileMascotSelected>(_onMascotSelected);
    on<ProfileGroupCreated>(_onGroupCreated);
    on<ProfileUpdateSubmitted>(_onUpdateSubmitted);
  }

  Future<void> _onInitialize(
    ProfileInitialize event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());

    final userResult = await _getCurrentUser.call();

    return userResult.fold(
      (error) => emit(ProfileError("Erro ao obter usuário: ${error.message}")),
      (user) {
        List<Mascot> mascots = [];
        try {
          mascots = Mocks.mascots;
        } catch (e) {
          emit(const ProfileError("Erro ao carregar mascotes"));
          return;
        }

        emit(ProfileLoaded(
          user: user,
          mascots: mascots,
          currentPageIndex: 0,
        ));
      },
    );
  }

  void _onPageChanged(
    ProfilePageChanged event,
    Emitter<ProfileState> emit,
  ) {
    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;
      emit(currentState.copyWith(currentPageIndex: event.pageIndex));
    }
  }

  void _onMascotSelected(
    ProfileMascotSelected event,
    Emitter<ProfileState> emit,
  ) {
    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;
      final updatedUser = currentState.user?.copyWith(mascot: event.mascot);

      emit(currentState.copyWith(
        user: updatedUser,
        message: "Mascote selecionado com sucesso",
      ));
    }
  }

  void _onGroupCreated(
    ProfileGroupCreated event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is ProfileLoaded) {
      emit(const ProfileLoading());

      final currentState = state as ProfileLoaded;
      final user = currentState.user;

      if (user != null && event.groupName.isNotEmpty) {
        final newGroup = Group(
          id: DateTime.now().millisecondsSinceEpoch,
          name: event.groupName,
          members: [],
          tasks: [],
        );

        final updatedUser = user.copyWith(
          groups: [...user.groups, newGroup],
        );

        emit(ProfileLoaded(
          user: updatedUser,
          mascots: currentState.mascots,
          currentPageIndex: currentState.currentPageIndex,
          message: "Grupo criado com sucesso",
        ));
      } else {
        emit(const ProfileError("Não foi possível criar o grupo"));
      }
    }
  }

  Future<void> _onUpdateSubmitted(
    ProfileUpdateSubmitted event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is ProfileLoaded) {
      emit(const ProfileLoading());

      final currentState = state as ProfileLoaded;
      final user = currentState.user;

      if (user == null) {
        emit(const ProfileError("Erro: usuário não carregado"));
        return;
      }

      if (user.mascot == null) {
        emit(const ProfileError("Erro: mascote não selecionado"));
        return;
      }

      if (user.groups.isEmpty) {
        emit(const ProfileError("Erro: grupo não criado"));
        return;
      }

      final result = await _saveUser.call(user);

      result.fold(
        (error) =>
            emit(ProfileError("Erro ao atualizar usuário: ${error.message}")),
        (_) =>
            emit(const ProfileUpdateSuccess("Usuário atualizado com sucesso!")),
      );
    }
  }
}
