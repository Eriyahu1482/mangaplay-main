import 'package:flutter/material.dart';
import 'package:mangaplay/pages/book_page.dart';
import 'package:mangaplay/pages/login_page.dart';
import 'package:mangaplay/pages/menu_page.dart';
import 'package:mangaplay/pages/profile_page.dart';
import 'package:mangaplay/widgets/main_button.dart';

class SettingPage extends StatelessWidget {
  static const routeName = '/setting-page';
  const SettingPage({super.key});

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
                Navigator.of(context).pushNamed(ProfilePage.routeName);
              },
            ),
            const SizedBox(height: 550),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Настройки', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Navigator.of(context).pushNamed(SettingPage.routeName);
              },
            ),
          ],
        ),
      ),
      body: CheckboxField(),
    );
  }
}

class CheckboxField extends StatefulWidget {
  @override
  _CheckboxFieldState createState() => _CheckboxFieldState();
}

class _CheckboxFieldState extends State<CheckboxField> {
  bool _isChecked = false;
  bool _isChecked1 = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }
   void _toggleCheckbox1(bool? value) {
    setState(() {
      _isChecked1 = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 40,),
            child: GestureDetector(
              onTap: () {
                _toggleCheckbox(!_isChecked);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: _toggleCheckbox,
                  ),
                  const Text('Получать уведомления', style: TextStyle(color: Colors.white,
                  fontSize: 24)),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _toggleCheckbox1(!_isChecked);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isChecked1,
                  onChanged: _toggleCheckbox1,
                ),
                const Text('Получать письма на почту', style: TextStyle(color: Colors.white,
                fontSize: 24)),
              ],
            ),
          ),
          const Spacer(),
          MainButtonWidget(
            buttonName: 'Выйти из аккаунта', 
          buttonColor: const Color.fromRGBO(70, 51, 111, 1), 
          buttonTextColor: Colors.white, 
          onTap:()
          {Navigator.of(context).pushNamed(LoginPage.routeName);}),
          const SizedBox(height: 70,)
        ],
      ),
    );
  }
}
