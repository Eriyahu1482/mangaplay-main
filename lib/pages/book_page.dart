import 'package:flutter/material.dart';
import 'package:mangaplay/models/manga.dart';
import 'package:mangaplay/pages/menu_page.dart';
import 'package:mangaplay/services/manga_provider.dart';
import 'package:mangaplay/widgets/small_new_card_widget.dart';
import 'package:provider/provider.dart';

class BookPage extends StatefulWidget {
  static const routeName = '/book-page';

  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  
  @override
  Widget build(BuildContext context) {
    final watchedModel = Provider.of<MangaProvider>(context).watchedModel;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(17, 20, 24, 1),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                MenuPage.routeName, (route) => false);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'MangaPlay',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: watchedModel.length,
        itemBuilder: (context, index) {
          Manga manga = watchedModel[index];
          return SmallNewCardWidget(manga: manga);
        }
      ),
      );
  }
}
  