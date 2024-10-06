import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:simple_chat/constants.dart';
import 'package:simple_chat/helper/show_snack_bar.dart';
import 'package:simple_chat/pages/chat_page.dart';
import 'package:simple_chat/pages/login_page.dart';
import 'package:simple_chat/widgets/custom_button.dart';
import 'package:simple_chat/widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static const String routeName = '/register_page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? email;

  String? password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.transparent,
      progressIndicator: const CircularProgressIndicator(
        color: Colors.white,
      ),
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(kLogo),
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
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                  ),
                  CustomButton(
                    title: 'REGISTER',
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          await registerUser();
                          showSnackBar(context, message: 'register Successful');
                          Navigator.of(context)
                              .pushReplacementNamed(ChatPage.routeName);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weeak password') {
                            showSnackBar(context, message: 'weeak password');
                          } else if (ex.code == 'email-already-in-use') {
                            showSnackBar(context,
                                message: 'Email-already-in-use');
                          }
                        } catch (ex) {
                          showSnackBar(context, message: ex.toString());
                        }
                        setState(() {
                          isLoading = false;
                        });
                      } else {
                        return showSnackBar(context,
                            message: 'wrong validation');
                      }
                    },
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
                            Navigator.of(context)
                                .pushReplacementNamed(LoginPage.routeName);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
