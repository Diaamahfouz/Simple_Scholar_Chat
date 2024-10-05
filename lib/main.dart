import 'package:flutter/material.dart';
import 'package:simple_chat/pages/login_page.dart';
import 'package:simple_chat/pages/register_page.dart';

void main() {
  runApp(SimpleChat());
}

class SimpleChat extends StatelessWidget {
  const SimpleChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.routeName: (_) => LoginPage(),
        RegisterPage.routeName: (_) => RegisterPage(),
      },
      initialRoute: LoginPage.routeName,
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
