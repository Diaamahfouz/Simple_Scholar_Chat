import 'package:flutter/material.dart';
import 'package:simple_chat/constants.dart';
import 'package:simple_chat/pages/register_page.dart';
import 'package:simple_chat/widgets/custom_button.dart';
import 'package:simple_chat/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String routeName = '/login_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset('assets/images/scholar.png'),
              Text(
                'Scholar chat',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              CustomTextField(
                hintText: 'Email',
              ),
              CustomTextField(
                hintText: 'Password',
              ),
              CustomButton(
                title: 'LOGIN',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have an account ?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegisterPage.routeName);
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Color(
                            0xffC7EDE6,
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
