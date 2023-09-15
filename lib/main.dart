import 'package:flutter/material.dart';
import 'package:messaging_app/features/posts/data/data_source.dart/remote_data_source.dart';
import 'package:messaging_app/features/posts/data/repository/post_repository_imp.dart';
import 'package:messaging_app/features/posts/presentation/splash_view.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
