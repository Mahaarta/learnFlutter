import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter/Models/models.dart';
import 'package:learn_flutter/Services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserState _userState = UserInitial();

  UserBloc() : super(UserInitial()) {
    on<UserEvent>(
      (event, emit) {
        if (event is LoadUser) {
          Future<UserModel> user = UserServices.getUser("BPRYO3kcRMf4A3gOELFW3VsZXns2");
          _userState = UserLoaded(user);
        } else if (event is SignOut) {
          _userState = UserInitial();
        }

        emit(_userState);
      },
    );
  }
}
