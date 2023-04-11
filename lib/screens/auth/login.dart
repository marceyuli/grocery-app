import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/consts/consts.dart';
import 'package:grocery_app/widgets/auth_button.dart';
import 'package:grocery_app/widgets/google_button.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextController = TextEditingController();
  final passTextController = TextEditingController();
  final passFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  var obscureText = true;
  @override
  void dispose() {
    emailTextController.dispose();
    passTextController.dispose();
    passFocusNode.dispose();
    super.dispose();
  }

  void submitFormOnLogin() {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print('the form is valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Swiper(
        duration: 800,
        autoplayDelay: 2000,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(Consts().authImagesPaths[index],
              fit: BoxFit.cover);
        },
        autoplay: true,
        itemCount: Consts().authImagesPaths.length,
      ),
      Container(
        color: Colors.black.withOpacity(0.6),
      ),
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 120,
              ),
              TextWidget(
                text: 'Welcome Back',
                color: Colors.white,
                textSize: 30,
                isTitle: true,
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                text: 'Sign in to continue',
                color: Colors.white,
                textSize: 18,
                isTitle: false,
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).requestFocus(passFocusNode),
                        controller: emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || value.contains('@')) {
                            return 'Please enter a valid email address';
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      //password
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {
                          submitFormOnLogin();
                        },
                        controller: passTextController,
                        focusNode: passFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: obscureText,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'Please enter a valid password';
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                child: Icon(
                                  obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                )),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      )
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forget password?',
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              AuthButton(fct: () {}, buttonText: 'Login'),
              const SizedBox(
                height: 10,
              ),
              const GoogleButton(),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  TextWidget(text: 'OR', color: Colors.white, textSize: 18),
                  const SizedBox(
                    width: 5,
                  ),
                  const Expanded(
                      child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AuthButton(
                  fct: () {},
                  buttonText: 'Continue as a guest',
                  primary: Colors.black),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    children: [
                      TextSpan(
                          text: '  Sign up',
                          style: const TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()..onTap = () {})
                    ]),
              )
            ],
          ),
        ),
      )
    ]));
  }
}
