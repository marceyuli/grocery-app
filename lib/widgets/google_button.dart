import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue[50],
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google.png',
              width: 40.0,
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
                text: 'Sign in with google', color: Colors.black, textSize: 18),
          ],
        ),
      ),
    );
  }
}
