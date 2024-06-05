import 'package:flutter/material.dart';

import '../class/textformfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController username = TextEditingController();
  TextEditingController emailUser = TextEditingController();
  TextEditingController passwordUser = TextEditingController();
  bool selectedShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: [Color(0xff304a62), Color(0xffe5e5e5)]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/user.png",
                    height: 200,
                    width: 200,
                  ),
                  TextFromFieldClass(
                    onTaps: () {
                      username.clear();
                    },
                    prefixIcons: Icon(Icons.supervised_user_circle),
                    suffixIcons: Icon(Icons.close_sharp),
                    textController: username,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFromFieldClass(
                    onTaps: () {
                      emailUser.clear();
                    },
                    prefixIcons: Icon(Icons.email),
                    suffixIcons: Icon(Icons.close_sharp),
                    textController: emailUser,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFromFieldClass(
                    onTaps: () {
                      setState(() {
                        selectedShowPassword = !selectedShowPassword;
                      });
                    },
                    prefixIcons: Icon(Icons.password),
                    suffixIcons: selectedShowPassword == false
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    textController: passwordUser,
                    showPassword: selectedShowPassword == false ? true : false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.blueGrey,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: const Center(
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSansRegular'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
