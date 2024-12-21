import 'package:flutter/material.dart';
import 'package:mangaplay/pages/book_page.dart';
import 'package:mangaplay/pages/menu_page.dart';
import 'package:mangaplay/pages/setting_page.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile-page';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                Navigator.of(context).pushNamed(BookPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people, color: Colors.white),
              title: const Text('Профиль', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Navigator.pop(context);
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 200),
            child: Text('Профиль',
            style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 34)
                          ),
          ),
          const SizedBox(height: 30,),
          const Padding(
            padding: EdgeInsets.only(right: 170),
            child: Text('Ваш аватар:',
            style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14)),
          ),
          const SizedBox(height: 10,),
          Center(
            child: Container(
              height: 300,
              width: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              color: Color.fromRGBO(255, 255, 255, 0.8),
              ),
              child: Center(child: 
              Image.asset('assets/IconStayAvake.png')
              ),
            ),
          ),
          const SizedBox(height: 50,),
          const Padding(
            padding: EdgeInsets.only(right: 170),
            child: Text('Ваш ник:',
            style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14)),
          ),
          const SizedBox(height: 10,),
          const Center(child: Text('TheMostFriendlyFire',
          style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24)),)
        ],
      ),
    );
  }
}