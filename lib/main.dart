import 'package:flutter/material.dart';
import 'package:simple_chat/pages/login_page.dart';

void main() {
  runApp(SimpleChat());
}
class SimpleChat extends StatelessWidget {
  const SimpleChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}