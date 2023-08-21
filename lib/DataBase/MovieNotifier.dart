import 'package:flutter/foundation.dart';
import 'package:endingcredit/DataBase/DataBase.dart';


class MovieNotifier extends ChangeNotifier {
  List _movies = [];

  List get movies {
    return [..._movies];
  }

  Future deleteMovie(String id) {
    _movies.removeWhere((element) => element.id == id);
    notifyListeners();
    return DBHelper().deleteMemo(id);
  }

  Future addMovie(
      String id,
      String movieTitle,
      String movieMemo,
      String memoEditTime,
      double ratings,
      int watched,
      int memoed,
      String movieOriginalTitle,
      String movieOneLine,
      ) async {
    final movie = Movie(
      id: id,
      movieTitle: movieTitle,
      movieMemo: movieMemo,
      memoEditTime: memoEditTime,
      ratings: ratings,
      watched: watched,
      memoed: memoed,
      movieOriginalTitle: movieOriginalTitle,
      movieOneLine: movieOneLine,
    );

    _movies.insert(0, movie);

    notifyListeners();

    DBHelper().insertMovie(movie);
  }

  Future updateMovie(
      String id,
      String movieTitle,
      String movieMemo,
      String memoEditTime,
      double ratings,
      int watched,
      int memoed,
      String movieOriginalTitle,
      String movieOneLine) async {
    final movie = Movie(
      id: id,
      movieTitle: movieTitle,
      movieMemo: movieMemo,
      memoEditTime: memoEditTime,
      ratings: ratings,
      watched: watched,
      memoed: memoed,
      movieOriginalTitle: movieOriginalTitle,
      movieOneLine: movieOneLine,
    );
    _movies[_movies.indexWhere((element) => element.id == id)] =
        movie;

    notifyListeners();

    DBHelper().updateMemo(movie);
  }

  Future getWatchedOrWant(int numb) async {
    final todoList = await DBHelper().getMovies(numb);

    _movies = todoList.map((item) {
      return Movie(
        id: item.id,
        movieTitle: item.movieTitle,
        movieMemo: item.movieMemo,
        memoEditTime: item.memoEditTime,
        ratings: item.ratings,
        watched: item.watched,
        memoed: item.memoed,
        movieOriginalTitle: item.movieOriginalTitle,
        movieOneLine: item.movieOneLine,
      );
    }).toList();

    _movies.sort((a, b) => b.memoEditTime.compareTo(a.memoEditTime));
    notifyListeners();
  }

}
