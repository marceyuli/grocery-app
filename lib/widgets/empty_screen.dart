import 'package:flutter/material.dart';
import 'package:grocery_app/inner%20screens/feed_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.buttontext});
  final String imagePath, title, subtitle, buttontext;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final themeState = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                imagePath,
                width: double.infinity,
                height: size.height * 0.4,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Whoops!',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(text: title, color: Colors.cyan, textSize: 20),
              const SizedBox(
                height: 20,
              ),
              TextWidget(text: subtitle, color: Colors.cyan, textSize: 20),
              const SizedBox(
                height: 80,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: color,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                  ),
                  onPressed: () {
                    GlobalMethods().navigateTo(
                        ctx: context, routeName: FeedScreen.routeName);
                  },
                  child: TextWidget(
                    text: buttontext,
                    textSize: 20,
                    color: themeState
                        ? Colors.grey.shade300
                        : Colors.grey.shade800,
                    isTitle: true,
                  ))
            ]),
      )),
    );
  }
}
