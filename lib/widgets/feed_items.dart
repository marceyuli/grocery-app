import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/widgets/heart_btn.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({super.key});

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final _quantityTextController = TextEditingController();

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;

    Size size = Utils(context).getScreenSize;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).cardColor,
          child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(5),
              child: Column(
                children: [
                  FancyShimmerImage(
                      imageUrl:
                          'https://purepng.com/public/uploads/large/purepng.com-apricotapricotfruitfreshorangeapricotsume-481521304824jpk3y.png',
                      height: size.width * 0.15,
                      width: size.width * 0.15,
                      boxFit: BoxFit.fill),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'Title',
                          color: color,
                          textSize: 20,
                          isTitle: true,
                        ),
                        const HeartBtn()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PriceWidget(),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Row(children: [
                            FittedBox(
                              child: TextWidget(
                                text: 'KG',
                                color: color,
                                textSize: 18,
                                isTitle: true,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                                child: TextFormField(
                              controller: _quantityTextController,
                              key: const ValueKey('10'),
                              style: TextStyle(
                                color: color,
                                fontSize: 18,
                              ),
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              enabled: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.]'))
                              ],
                            ))
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      child: TextWidget(
                        text: 'Add to cart',
                        maxLines: 1,
                        color: color,
                        textSize: 20,
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).cardColor),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12.0),
                                          bottomRight:
                                              Radius.circular(12.0))))),
                    ),
                  )
                ],
              ))),
    );
  }
}
