import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/movie_provider.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFF4F1EC),
          primaryColor: Color(0xFF6BA292),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF6BA292),
            foregroundColor: Colors.white,
          ),
        ),
        home: HomeView(),
      ),
    );
  }
}