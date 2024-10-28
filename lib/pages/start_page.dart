import 'package:flutter/material.dart';
import 'package:mangaplay/pages/login_page.dart';
import 'package:mangaplay/pages/registration_page.dart';
import 'package:mangaplay/widgets/main_button.dart';

class StartPage extends StatelessWidget {
  static const routeName = '/start-page';
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              width: 250,
              height: 250,
              child: Image.asset('assets/IconSleep.png')),
            const SizedBox(height: 220),
             MainButtonWidget(
              onTap: () {
                Navigator.of(context).pushNamed(LoginPage.routeName);
              },
              buttonName: 'Войти',
              buttonColor: const Color.fromRGBO(70, 51, 111, 1),
              buttonTextColor: Colors.white,
            ),
            const SizedBox(height: 20),
             MainButtonWidget(
              buttonName: 'Зарегистрироваться',
              buttonColor: Colors.transparent,
              buttonTextColor: Colors.white,
              buttonShadowColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).pushNamed(RegistrationPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}