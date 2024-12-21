import 'package:flutter/material.dart';
import 'package:mangaplay/models/manga.dart';


class MangaProvider with ChangeNotifier {
  final List<Manga> _watchedModel = [Manga(mangaGenres: '',mangaTitle:'', mangaImageUrl: '', mangaYear: '', mangaDescription: ''),];

  List<Manga> get watchedModel => _watchedModel;

  void addManga(Manga manga) {
    if (!_watchedModel.contains(manga)) {
      _watchedModel.add(manga);
      notifyListeners();
    }
  }
    void removeManga(Manga manga) {
    _watchedModel.remove(manga);
    notifyListeners(); // Уведомляем слушателей о изменениях
  }
}