import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final quantityTextController = TextEditingController(text: '1');
  @override
  void initState() {
    quantityTextController.text = '';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;

    return GestureDetector(
      onTap: () {},
      child: Row(children: [
        Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  height: size.width * 0.25,
                  width: size.width * 0.25,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
                  child: FancyShimmerImage(
                      imageUrl:
                          'https://purepng.com/public/uploads/large/purepng.com-apricotapricotfruitfreshorangeapricotsume-481521304824jpk3y.png',
                      boxFit: BoxFit.fill),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Title',
                      color: color,
                      textSize: 20,
                      isTitle: true,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: Row(
                        children: [
                          quantityController(
                              fct: () {},
                              icon: CupertinoIcons.minus,
                              color: Colors.red),
                          Flexible(
                            flex: 1,
                            child: TextField(
                              controller: quantityTextController,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide())),
                            ),
                          ),
                          quantityController(
                              fct: () {},
                              icon: CupertinoIcons.plus,
                              color: Colors.green)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ))
      ]),
    );
  }

  Widget quantityController(
      {required Function fct, required IconData icon, required Color color}) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
