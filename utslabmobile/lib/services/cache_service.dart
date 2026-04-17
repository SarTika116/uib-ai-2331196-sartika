import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/movie_model.dart';

class CacheService {
  Future<void> saveMovies(List<Movie> movies) async {
    final prefs = await SharedPreferences.getInstance();
    String data = jsonEncode(movies.map((e) => e.toJson()).toList());
    await prefs.setString('movies', data);
  }

  Future<List<Movie>> getMovies() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('movies');

    if (data != null) {
      List decoded = jsonDecode(data);
      return decoded.map((e) => Movie.fromJson(e)).toList();
    }
    return [];
  }
}