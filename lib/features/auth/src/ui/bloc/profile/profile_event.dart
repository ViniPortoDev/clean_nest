import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class ProfileInitialize extends ProfileEvent {
  const ProfileInitialize();
}

class ProfilePageChanged extends ProfileEvent {
  final int pageIndex;

  const ProfilePageChanged(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}

class ProfileMascotSelected extends ProfileEvent {
  final Mascot mascot;

  const ProfileMascotSelected(this.mascot);

  @override
  List<Object?> get props => [mascot];
}

class ProfileGroupCreated extends ProfileEvent {
  final String groupName;

  const ProfileGroupCreated(this.groupName);

  @override
  List<Object?> get props => [groupName];
}

class ProfileUpdateSubmitted extends ProfileEvent {
  const ProfileUpdateSubmitted();
}
