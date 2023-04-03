import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/heart_btn.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/_ProductDetailsScreen';
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final quantityTextController = TextEditingController();
  @override
  void initState() {
    quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
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
      ),
      body: Column(
        children: [
          Center(
            child: Row(
              children: [
                FancyShimmerImage(
                  imageUrl:
                      'https://purepng.com/public/uploads/large/purepng.com-apricotapricotfruitfreshorangeapricotsume-481521304824jpk3y.png',
                  boxFit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: Column(
              children: [
                Row(
                  children: [
                    TextWidget(
                      text: 'Durazno',
                      color: color,
                      textSize: 25,
                      isTitle: true,
                    ),
                    const Spacer(),
                    const HeartBtn(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      TextWidget(
                        text: '\$0.99',
                        color: Colors.green,
                        textSize: 25,
                      ),
                      const Text('/Kg'),
                      const Spacer(),
                      Material(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextWidget(
                            text: 'Free delivery',
                            color: Colors.white,
                            textSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9]')),
                            ],
                            onChanged: (v) {
                              setState(() {
                                if (v.isEmpty) {
                                  quantityTextController.text = '1';
                                } else {
                                  return;
                                }
                              });
                            },
                          ),
                        ),
                        quantityController(
                            fct: () {},
                            icon: CupertinoIcons.plus,
                            color: Colors.green)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        TextWidget(
                          text: 'Total',
                          color: Colors.red,
                          textSize: 25,
                          isTitle: true,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text: '\$0.99',
                          color: color,
                          textSize: 20,
                          isTitle: true,
                        ),
                        const Text('/1kg'),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidget(
                          text: 'In Cart',
                          color: Colors.white,
                          textSize: 20,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
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
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
