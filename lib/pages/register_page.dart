import 'package:flutter/material.dart';
import 'package:simple_chat/pages/login_page.dart';
import 'package:simple_chat/widgets/custom_button.dart';
import 'package:simple_chat/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
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
            const Spacer(
              flex: 1,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            CustomTextField(
              hintText: 'name',
            ),
            CustomTextField(
              hintText: 'Email',
            ),
            CustomTextField(
              hintText: 'Password',
            ),
            CustomButton(
              title: 'REGISTER',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You have an account ?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color(
                          0xffC7EDE6,
                        ),
                      ),
                    ))
              ],
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
