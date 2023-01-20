import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter/Models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageState _pageState = OnMainPage();

  PageBloc() : super(OnInitialPage()) {
    on<PageEvent>((event, emit) {
      if (event is GoToLoginPage) {
        _pageState = OnLoginPage();
      } else if (event is GoToMainPage) {
        _pageState = OnMainPage();
      } else if (event is GoToSplashPage) {
        _pageState = OnSplashPage();
      } else if (event is GoToSignUpPage) {
        _pageState = OnSignUpPage(event.registrationData);
      } else if (event is GoToAccountConfirmationPage) {
        _pageState = OnAccountConfirmationPage(event.registrationData);
      } else if (event is GoToPreferencePage) {
        _pageState = OnPreferencePage(event.registrationData);
      }

      emit(_pageState);
    });
  }
}
