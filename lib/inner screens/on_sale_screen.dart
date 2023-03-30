import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScren";
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              IconlyLight.arrowLeft2,
              color: color,
            ),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Products on sale',
            color: color,
            textSize: 24,
            isTitle: true,
          ),
        ),
        body: isEmpty
            // ignore: dead_code
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('No products on sale yet! \n Stay tuned',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: color,
                          fontSize: 30,
                          fontWeight: FontWeight.w700)),
                ),
              )
            : GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.zero,
                childAspectRatio: size.width / (size.height * 0.45),
                children: List.generate(16, (index) {
                  return const OnSaleWidget();
                }),
              ));
  }
}
