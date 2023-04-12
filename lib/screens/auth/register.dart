import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/screens/auth/login.dart';
import 'package:grocery_app/widgets/auth_button.dart';

import '../../consts/consts.dart';
import '../../services/utils.dart';
import '../../widgets/text_widget.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailTextController = TextEditingController();
  final passTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final passFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  bool obscureText = true;
  @override
  void dispose() {
    fullNameController.dispose();
    emailTextController.dispose();
    passTextController.dispose();
    addressTextController.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
    addressFocusNode.dispose();
    super.dispose();
  }

  void submitFormOnRegister() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Color color = Utils(context).color;
    return Scaffold(
        body: Stack(
      children: <Widget>[
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
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(
                  height: 60.0,
                ),
                InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => Navigator.canPop(context)
                        ? Navigator.pop(context)
                        : null,
                    child: Icon(
                      IconlyLight.arrowLeft2,
                      color: theme == true ? Colors.white : Colors.black,
                      size: 24,
                    )),
                const SizedBox(
                  height: 40,
                ),
                TextWidget(
                  text: 'Welcome',
                  color: Colors.white,
                  textSize: 30,
                  isTitle: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextWidget(
                  text: 'Sign up to continue',
                  color: Colors.white,
                  textSize: 18,
                  isTitle: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: formKey,
                  child: Column(children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(emailFocusNode),
                      keyboardType: TextInputType.name,
                      controller: fullNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is missing';
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: 'Full name',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      focusNode: emailFocusNode,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(passFocusNode),
                      keyboardType: TextInputType.emailAddress,
                      controller: emailTextController,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid Email adress';
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //password
                    TextFormField(
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
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(addressFocusNode),
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      focusNode: addressFocusNode,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: submitFormOnRegister,
                      keyboardType: TextInputType.emailAddress,
                      controller: addressTextController,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 10) {
                          return 'Please enter a valid address';
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(color: Colors.white),
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                          hintText: 'Shipping address',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red))),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forget password',
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.italic),
                          )),
                    ),
                    AuthButton(
                        fct: () {
                          submitFormOnRegister();
                        },
                        buttonText: 'Sign Up'),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Already a user?',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Sign in',
                              style: const TextStyle(
                                  color: Colors.lightBlue, fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(context,
                                      LoginScreen.routeName as Route<Object?>);
                                })
                        ]))
                  ]),
                )
              ]),
        )
      ],
    ));
  }
}
