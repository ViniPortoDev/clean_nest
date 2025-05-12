import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileLoaded extends ProfileState {
  final User? user;
  final List<Mascot> mascots;
  final int currentPageIndex;
  final String? message;

  const ProfileLoaded({
    required this.user,
    required this.mascots,
    required this.currentPageIndex,
    this.message,
  });

  ProfileLoaded copyWith({
    User? user,
    List<Mascot>? mascots,
    int? currentPageIndex,
    String? message,
  }) {
    return ProfileLoaded(
      user: user ?? this.user,
      mascots: mascots ?? this.mascots,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      message: message,
    );
  }

  @override
  List<Object?> get props => [user, mascots, currentPageIndex, message];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}

class ProfileUpdateSuccess extends ProfileState {
  final String message;

  const ProfileUpdateSuccess(this.message);

  @override
  List<Object?> get props => [message];
}