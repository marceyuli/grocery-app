import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/inner%20screens/product_details.dart';
import 'package:grocery_app/models/products_model.dart';
import 'package:grocery_app/providers/cart_provider.dart';
import 'package:grocery_app/providers/products_provider.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/widgets/heart_btn.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
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
    final productModel = Provider.of<ProductModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    bool? isInCart = cartProvider.getCartItems.containsKey(productModel.id);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).cardColor,
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                    arguments: productModel.id);
                /* GlobalMethods().navigateTo(
                    ctx: context, routeName: ProductDetailsScreen.routeName); */
              },
              borderRadius: BorderRadius.circular(5),
              child: Column(
                children: [
                  FancyShimmerImage(
                      imageUrl: productModel.imageUrl,
                      height: size.width * 0.15,
                      width: size.width * 0.15,
                      boxFit: BoxFit.fill),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: TextWidget(
                            text: productModel.title,
                            color: color,
                            textSize: 18,
                            isTitle: true,
                            maxLines: 1,
                          ),
                        ),
                        const Flexible(flex: 1, child: HeartBtn())
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: PriceWidget(
                            salePrice: productModel.salePrice,
                            price: productModel.price,
                            textPrice: _quantityTextController.text,
                            isOnSale: productModel.isOnSale,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          flex: 6,
                          child: Row(children: [
                            FittedBox(
                              child: TextWidget(
                                text: productModel.isPiece ? 'Piece' : 'KG',
                                color: color,
                                textSize: 15,
                                isTitle: true,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                                flex: 2,
                                child: TextFormField(
                                  controller: _quantityTextController,
                                  key: const ValueKey('10 \$'),
                                  style: TextStyle(
                                    color: color,
                                    fontSize: 18,
                                  ),
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  enabled: true,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isEmpty) {
                                        _quantityTextController.text = '1';
                                      } else {
                                        _quantityTextController.text =
                                            _quantityTextController.text;
                                      }
                                    });
                                  },
                                  onSaved: (value) {},
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
                      onPressed: isInCart? null : () {
                        cartProvider.addProductsToTheCart(
                            productId: productModel.id,
                            quantity: int.parse(_quantityTextController.text));
                      },
                      child: TextWidget(
                        text: isInCart? 'In Cart' : 'Add to cart',
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
