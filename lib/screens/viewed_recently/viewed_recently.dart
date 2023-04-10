import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/screens/viewed_recently/viewed_widget.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/back_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const routeName = '/ViewedScreenState';
  const ViewedRecentlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                GlobalMethods().warningDialog(
                    title: 'Empty your history?',
                    subtitle: 'Are you sure?',
                    fct: () {},
                    context: context);
              },
              icon: Icon(
                IconlyBroken.delete,
                color: color,
              ))
        ],
        leading: const BackWidget(),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: TextWidget(text: 'History', color: color, textSize: 24.0),
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) {
            return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: ViewedRecentlyWidget(),
            );
          }),
    );
  }
}
