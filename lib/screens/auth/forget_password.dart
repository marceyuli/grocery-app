import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/auth_button.dart';
import 'package:grocery_app/widgets/back_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../consts/consts.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = '/ForgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailTextController = TextEditingController();
  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }

  void forgetPassFCT() async {}
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
        body: Stack(
      children: [
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              const BackWidget(),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Forget Password',
                color: Colors.white,
                textSize: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailTextController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: 'Email address',
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
                height: 15,
              ),
              AuthButton(
                  fct: () {
                    forgetPassFCT();
                  },
                  buttonText: 'Reset now')
            ],
          ),
        )
      ],
    ));
  }
}
