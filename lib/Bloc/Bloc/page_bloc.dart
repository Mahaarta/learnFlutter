import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage()) {
    on<PageEvent>((event, emit) {});
  }

  Stream<PageState> mapEventToState(
    PageEvent pageEvent,
  ) async* {
    if (kDebugMode) {
      print("pageEventt = $pageEvent");
    }
    if (pageEvent is GoToSplashPage) {
      yield OnSplashPage();
    } else if (pageEvent is GoToLoginPage) {
      yield OnLoginPage();
    } else if (pageEvent is GoToMainPage) {
      yield OnMainPage();
    }
  }
}
