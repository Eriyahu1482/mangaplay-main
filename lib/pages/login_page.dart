import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mangaplay/pages/menu_page.dart';
import 'package:mangaplay/models/db_helper.dart';
import 'package:mangaplay/pages/registration_page.dart';
import 'package:mangaplay/widgets/main_button.dart';
import 'package:mangaplay/widgets/small_button.dart';
import 'package:mangaplay/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DbHelper _dbHelper = DbHelper();

  _userLogin() async {
    String password = _passwordController.text;
    String email = _emailController.text;

    bool isAuthenticated = await _dbHelper.isUserAuthenticated(email, password);
    if (isAuthenticated) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed(MenuPage.routeName);
    } else {
      if (kDebugMode) {
        print('Login failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(17, 20, 24, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                  child: Text(
                'Войти',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 34),
              )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/IconSleep.png'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              TextFieldWidget(
                  controller: _emailController,
                  hintText: 'Введите Email',
                  icon: const Icon(Icons.email,
                      color: Color.fromRGBO(70, 51, 111, 1))),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: _passwordController,
                hintText: 'Введите пароль',
                icon: const Icon(Icons.lock,
                    color: Color.fromRGBO(70, 51, 111, 1)),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: MainButtonWidget(
                  buttonName: 'Войти',
                  buttonColor: const Color.fromRGBO(70, 51, 111, 1),
                  buttonTextColor: Colors.white,
                  onTap: _userLogin,
                ),
              ),
               Padding(
                    padding: const EdgeInsets.only(left: 160),
                    child: SmallButtonWidget(
                      buttonName: 'Нет аккаунта?',
                      buttonColor: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).pushNamed(RegistrationPage.routeName);
                      },
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
