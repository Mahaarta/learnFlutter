import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter/Models/models.dart';
import 'package:learn_flutter/Services/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async {
      if (event is FetchMovie) {
        List<Movie> movies = await MovieServices.getMovie(1);
        emit(MovieLoaded(movies: movies));
      }
    });
  }
}
