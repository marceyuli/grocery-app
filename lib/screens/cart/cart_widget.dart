import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/models/products_model.dart';
import 'package:grocery_app/providers/cart_provider.dart';
import 'package:grocery_app/providers/products_provider.dart';
import 'package:grocery_app/providers/wishlist_provider.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/heart_btn.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../inner screens/product_details.dart';
import '../../providers/products_provider.dart';
import '../../services/global_methods.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key, required this.q});
  final int q;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final quantityTextController = TextEditingController();
  @override
  void initState() {
    quantityTextController.text = widget.q.toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
    final productsProvider = Provider.of<ProductsProvider>(context);
    final cartModel = Provider.of<CartModel>(context);
    final getCurrProd = productsProvider.getProductById(cartModel.productId);
    double usedPrice =
        getCurrProd.isOnSale ? getCurrProd.salePrice : getCurrProd.price;
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    bool? _isInWishlist =
        wishlistProvider.getWishlistItems.containsKey(getCurrProd.id);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.routeName,
            arguments: cartModel.productId);
      },
      child: Row(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: size.width * 0.25,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: FancyShimmerImage(
                          imageUrl: getCurrProd.imageUrl, boxFit: BoxFit.fill),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: getCurrProd.title,
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
                                  fct: () {
                                    if (quantityTextController.text == '1') {
                                      return;
                                    } else {
                                      cartProvider.reduceQuantityByOne(
                                          cartModel.productId);
                                      setState(() {
                                        quantityTextController.text =
                                            (int.parse(quantityTextController
                                                        .text) -
                                                    1)
                                                .toString();
                                      });
                                    }
                                  },
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
                                  fct: () {
                                    cartProvider.increaseQuantityByOne(
                                        cartModel.productId);
                                    setState(() {
                                      quantityTextController.text = (int.parse(
                                                  quantityTextController.text) +
                                              1)
                                          .toString();
                                    });
                                  },
                                  icon: CupertinoIcons.plus,
                                  color: Colors.green)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              cartProvider.removeOneItem(cartModel.productId);
                            },
                            child: const Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          HeartBtn(
                            productId: getCurrProd.id,
                            isInWishlist: _isInWishlist,
                          ),
                          TextWidget(
                            text: '\$${usedPrice.toStringAsFixed(2)}',
                            color: color,
                            textSize: 18,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                )),
          ),
        )
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
