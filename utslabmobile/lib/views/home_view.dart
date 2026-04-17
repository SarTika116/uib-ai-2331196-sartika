import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_card.dart';
import '../widgets/loading_shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String query = '';

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<MovieProvider>(context, listen: false).fetchMovies());
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    final filtered = provider.movies.where((movie) {
      final matchSearch =
          movie.title.toLowerCase().contains(query.toLowerCase());

      final matchDirector = provider.selectedDirector == "All" ||
          movie.director == provider.selectedDirector;

      return matchSearch && matchDirector;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("🌿 Ghibli Movies"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 🔥 OFFLINE BANNER
          if (provider.isOffline)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: Colors.orange,
              child: Text(
                "⚠️ You are offline (showing cached data)",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),

          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Discover magical worlds ✨",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search movie...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
          ),

          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonFormField<String>(
              value: provider.selectedDirector,
              items: provider.directors.map((director) {
                return DropdownMenuItem(
                  value: director,
                  child: Text(director),
                );
              }).toList(),
              onChanged: (value) {
                provider.setDirector(value!);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Filter by Director",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),

          SizedBox(height: 10),

          Expanded(
            child: provider.isLoading
                ? LoadingShimmer()
                : filtered.isEmpty
                    ? Center(
                        child: Text("No movies found 😢"),
                      )
                    : ListView.builder(
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          return MovieCard(movie: filtered[index]);
                        },
                      ),
          ),
        ],
      ),
    );
  }
}