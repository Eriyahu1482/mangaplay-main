import 'package:flutter/material.dart';
import 'package:mangaplay/pages/book_page.dart';
import 'package:mangaplay/pages/login_page.dart';
import 'package:mangaplay/pages/menu_page.dart';
import 'package:mangaplay/pages/profile_page.dart';
import 'package:mangaplay/pages/registration_page.dart';
import 'package:mangaplay/pages/setting_page.dart';
import 'package:mangaplay/pages/start_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const LoginPage(),
      routes: {
        StartPage.routeName:(context) => const StartPage(),
        RegistrationPage.routeName:(context) => const RegistrationPage(),
        LoginPage.routeName:(context) => const LoginPage(),
        MenuPage.routeName:(context) => const MenuPage(),
        BookPage.routeName:(context) => const BookPage(),
        ProfilePage.routeName:(context) => const ProfilePage(),
        SettingPage.routeName:(context) => const SettingPage(),
      },
    );
  }
}