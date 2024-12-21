import 'package:flutter/material.dart';
import 'package:mangaplay/models/manga.dart';
import 'package:mangaplay/pages/menu_page.dart';
import 'package:mangaplay/pages/profile_page.dart';
import 'package:mangaplay/pages/setting_page.dart';
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
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'MangaPlay',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(17, 20, 24, 1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(height: 70),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Главная', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pushNamed(MenuPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.white),
              title: const Text('Избранное', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Navigator.of(context).pushNamed(BookPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people, color: Colors.white),
              title: const Text('Профиль', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pushNamed(ProfilePage.routeName);
              },
            ),
            const SizedBox(height: 550),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Настройки', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pushNamed(SettingPage.routeName);
              },
            ),
          ],
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: watchedModel.length - 1, // Уменьшаем на 1, чтобы начать со второго элемента
        itemBuilder: (context, index) {
          // Увеличиваем индекс на 1, чтобы получить правильный элемент
          Manga manga = watchedModel[index + 1];
          
          return Dismissible(
            key: Key(manga.mangaTitle), // Уникальный ключ
            direction: DismissDirection.endToStart,
            background: Container(color: Colors.red),
            onDismissed: (direction) {
              // Удаляем элемент из модели
              Provider.of<MangaProvider>(context, listen: false).removeManga(manga);
              
              // Показываем Snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${manga.mangaTitle} удалён")),
              );
            },
            child: SmallNewCardWidget(manga: manga),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10), // Разделитель между элементами
      ),
    );
  }
}
