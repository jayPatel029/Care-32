import 'package:dental_minor/pages/login.dart';
import 'package:flutter/material.dart';

import 'RegisterPage.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show login
  bool showLoginPage = true;

  //toggle between login and register
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage)
      {
        return LoginPage(onTap: togglePages,);
      }
    else
      {
        return RegisterPage(onTap: togglePages,);
      }
  }
}
