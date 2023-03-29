import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/heart_btn.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          color: Theme.of(context).cardColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FancyShimmerImage(
                            imageUrl:
                                'https://purepng.com/public/uploads/large/purepng.com-apricotapricotfruitfreshorangeapricotsume-481521304824jpk3y.png',
                            height: size.width * 0.15,
                            width: size.width * 0.15,
                            boxFit: BoxFit.fill),
                        Column(
                          children: [
                            TextWidget(
                              text: '1KG',
                              color: color,
                              textSize: 22,
                              isTitle: true,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    IconlyLight.bag2,
                                    size: 22,
                                    color: color,
                                  )),
                              const HeartBtn(),
                            ]),
                          ],
                        )
                      ],
                    ),
                    PriceWidget(),
                    const SizedBox(
                      height: 5,
                    ),
                    TextWidget(
                        text: 'Product title', color: color, textSize: 16),
                    const SizedBox(
                      height: 5,
                    ),
                  ]),
            ),
          )),
    );
  }
}
