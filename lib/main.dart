import 'package:flutter/material.dart';
import 'package:mangaplay/my_app.dart';
import 'package:mangaplay/services/manga_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MangaProvider(),
      child: const MyApp(),
    ),
  );
}
