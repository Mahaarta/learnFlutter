import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageState _pageState = OnMainPage();

  PageBloc() : super(OnInitialPage()) {
    on<PageEvent>((event, emit) {
      _pageState = (event == GoToLoginPage())
          ? OnLoginPage()
          : (event == GoToMainPage())
              ? OnMainPage()
              : (event == GoToSplashPage())
                  ? OnSplashPage()
                  : OnInitialPage();
      emit(_pageState);
    });
  }
}
