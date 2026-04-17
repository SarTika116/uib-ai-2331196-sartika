import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../services/api_service.dart';
import '../services/cache_service.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> movies = [];
  bool isLoading = false;
  bool isOffline = false;
  String error = '';

  String selectedDirector = "All";

  final api = ApiService();
  final cache = CacheService();

  Future<void> fetchMovies() async {
    isLoading = true;
    isOffline = false;
    notifyListeners();

    try {
      final result = await api.fetchMovies();
      movies = result;
      await cache.saveMovies(result);
      error = '';
    } catch (e) {
      movies = await cache.getMovies();
      isOffline = true;
      error = "No Internet Connection";
    }

    isLoading = false;
    notifyListeners();
  }

  List<String> get directors {
    final list = movies.map((e) => e.director).toSet().toList();
    list.insert(0, "All");
    return list;
  }

  void setDirector(String value) {
    selectedDirector = value;
    notifyListeners();
  }
}