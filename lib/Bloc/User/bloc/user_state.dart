part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final Future<UserModel> user;
  const UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}
