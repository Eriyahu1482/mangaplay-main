import 'package:flutter/material.dart';
import 'package:mangaplay/pages/login_page.dart';
import 'package:mangaplay/models/db_helper.dart';
import 'package:mangaplay/widgets/main_button.dart';
import 'package:mangaplay/widgets/small_button.dart';
import 'package:mangaplay/widgets/text_field.dart';
import 'package:mangaplay/models/user_model.dart';

class RegistrationPage extends StatefulWidget {
  static const routeName = '/registration-page';
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final DbHelper _dbHelper = DbHelper();

  _singUp() async {
    String nick = _nicknameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (nick.isEmpty || email.isEmpty || password.isEmpty) {
print('registrarion failed');
} else {
UserModel user = UserModel(email: email, password: password);
await _dbHelper.insertUser(user);
Navigator.of(context).pushNamedAndRemoveUntil(
LoginPage.routeName,
(Route<dynamic> route) => false,
);
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(17, 20, 24, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Регистрация',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                ),
              ),
              Image.asset('assets/IconStayAvake.png'),
              const SizedBox(height: 5),
              Column(
                children: <Widget>[
                  const SizedBox(height: 2),
                  TextFieldWidget(
                    controller: _nicknameController,
                    hintText: 'Введите имя',
                    icon: const Icon(Icons.email,
                        color: Color.fromRGBO(91, 46, 108, 1)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    controller: _emailController,
                    hintText: 'Введите email',
                    icon: const Icon(Icons.email,
                        color: Color.fromRGBO(91, 46, 108, 1)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    controller: _passwordController,
                    hintText: 'Введите пароль',
                    icon: const Icon(Icons.email,
                        color: Color.fromRGBO(91, 46, 108, 1)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MainButtonWidget(
                    buttonName: 'ЗАРЕГЕСТРИРОВАТЬСЯ',
                    buttonColor: const Color.fromRGBO(70, 51, 111, 1),
                    buttonTextColor: Colors.white,
                    onTap: _singUp,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 160),
                    child: SmallButtonWidget(
                      buttonName: 'Уже есть аккаунт?',
                      buttonColor: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).pushNamed(LoginPage.routeName);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}