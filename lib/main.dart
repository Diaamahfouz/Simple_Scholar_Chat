import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simple_chat/firebase_options.dart';
import 'package:simple_chat/pages/chat_page.dart';
import 'package:simple_chat/pages/login_page.dart';
import 'package:simple_chat/pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        ChatPage.routeName: (_) => ChatPage(),
      },
      initialRoute: LoginPage.routeName,
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
