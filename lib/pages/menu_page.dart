import 'package:flutter/material.dart';
import 'package:mangaplay/models/manga.dart';
import 'package:mangaplay/pages/book_page.dart';
import 'package:mangaplay/pages/detail_manga_page.dart';
import 'package:mangaplay/pages/profile_page.dart';
import 'package:mangaplay/pages/setting_page.dart';
import 'package:mangaplay/widgets/card_widget.dart';
import 'package:mangaplay/widgets/search_card_widget.dart';
import 'package:mangaplay/widgets/small_card.dart';
import 'package:mangaplay/widgets/small_new_card_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  static const routeName = '/menu-page';

  @override
  // ignore: library_private_types_in_public_api
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool _isSearching = false;
  List<Manga> _filteredMangaData = mangaData; // Изначально полный список

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
// Сбросить запрос при закрытии поиска
        _filteredMangaData = mangaData; // Вернуть полный список
      }
    });
  }

  void _filterManga(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredMangaData = mangaData; // Сбросить фильтр
      });
    } else {
      setState(() {
        _filteredMangaData = fullSearchModel
            .where((manga) => manga.mangaTitle.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: _isSearching
            ? TextField(
              
        cursorColor: Colors.white,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Поиск...',
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: Colors.white,),
                onChanged: _filterManga, // Обновление фильтра при вводе
              )
            : const Text(
                'MangaPlay',
                style: TextStyle(color: Colors.white),
              ),
        centerTitle: true,
  actions: <Widget>[
    Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: _toggleSearch,
        child: Icon(
          _isSearching ? Icons.close : Icons.search,
          color: Colors.white,
              ),
            ),
          ),
        ],
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
                Navigator.of(context).pushNamed(BookPage.routeName);
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
      backgroundColor: const Color.fromRGBO(17, 20, 24, 1),
      body: Stack(
        children: [
          // Основное содержимое
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  const Text(
                    'Главная',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 34),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Рекомендации',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var manga = mangaData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailMangaPage(manga: manga)));
                          },
                          child: CardWidget(manga: mangaData[index]),
                        );
                      },
                      separatorBuilder: (_, index) => const SizedBox(width: 8),
                      itemCount: mangaData.length,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Новинки',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 400,
                        child: ListView.separated(
                          itemCount: mangaNewData.length,
                          itemBuilder: (context, index) {
                            return SmallNewCardWidget(manga: mangaNewData[index]);
                          },
                          separatorBuilder: (_, index) =>
                              const SizedBox(height: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Хиты',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 500,
                    child: GridView.builder(
                      padding: const EdgeInsets.only(right: 20),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: mangaHitsData.length,
                      itemBuilder: (context, index) {
                        return SmallHitsCardWidget(manga: mangaHitsData[index]);
                      },
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          // Результаты поиска
          if (_isSearching) 
            Container(
              height: 390,
              decoration: const BoxDecoration(
              color: Color.fromRGBO(49, 49, 57, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Результаты поиска:',
                    style: TextStyle( color: Colors.white),
                  ),
                  _filteredMangaData.isNotEmpty
                      ? 
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 350,
                        child: ListView.separated(
                          itemCount: _filteredMangaData.length,
                          itemBuilder: (context, index) {
                            return SearchCardWidget(manga: _filteredMangaData[index]);
                          },
                          separatorBuilder: (_, index) =>
                              const SizedBox(height: 15),
                        ),
                      ),
                    ),
                  )
                      : const SizedBox(
                        width: double.infinity,
                        child: Text(
                            'Нет результатов',
                            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red, fontSize: 16),
                          ),
                      ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
