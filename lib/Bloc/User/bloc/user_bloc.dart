import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter/Extensions/extensions.dart';
import 'package:learn_flutter/Models/models.dart';
import 'package:learn_flutter/Services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserState _userState = UserInitial();

  UserBloc() : super(UserInitial()) {
    on<UserEvent>(
      (event, emit) async {
        if (event is LoadUser) {
          Future<UserModel> user = UserServices.getUser(event.id);
          _userState = UserLoaded(user);
          emit(_userState);
        } else if (event is SignOut) {
          _userState = UserInitial();
          emit(_userState);
        } else if (event is UpdateData) {
          Future<UserModel> updateUser = (state as UserLoaded).user.then(
                (value) async => value.copyWith(
                  name: event.name,
                  profilePicture: event.profileImage,
                ),
              );

          //await UserServices.updateUser(updateUser);

          updateUser.then((UserModel usm) {
            UserServices.updateUser(usm);
          });

          emit(UserLoaded(updateUser));
        }
      },
    );
  }
}
