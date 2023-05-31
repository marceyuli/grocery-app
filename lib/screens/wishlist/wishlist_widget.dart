import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/inner%20screens/product_details.dart';
import 'package:grocery_app/models/wishlist_model.dart';
import 'package:grocery_app/providers/products_provider.dart';
import 'package:grocery_app/providers/wishlist_provider.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/heart_btn.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class WishlistWidget extends StatefulWidget {
  const WishlistWidget({super.key});

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);

    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final wishlistModel = Provider.of<WishlistModel>(context);

    final getCurrProd = productProvider.getProductById(wishlistModel.productId);
    bool? _isInWishlist =
        wishlistProvider.getWishlistItems.containsKey(getCurrProd.id);
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    final double usedPrice =
        getCurrProd.isOnSale ? getCurrProd.salePrice : getCurrProd.price;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDetailsScreen.routeName,
              arguments: wishlistModel.productId);
        },
        child: Container(
          height: size.height * 0.2,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(children: [
            Flexible(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                //width: size.width * 0.2,
                height: size.width * 0.25,
                child: FancyShimmerImage(
                  imageUrl: getCurrProd.imageUrl,
                  boxFit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            IconlyLight.bag2,
                            color: color,
                          ),
                        ),
                        HeartBtn(
                          productId: getCurrProd.id,
                          isInWishlist: _isInWishlist,
                        ),
                      ],
                    ),
                  ),
                  TextWidget(
                    text: getCurrProd.title,
                    color: color,
                    textSize: 20.0,
                    maxLines: 2,
                    isTitle: true,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextWidget(
                    text: '\$${usedPrice.toStringAsFixed(2)}',
                    color: color,
                    textSize: 18.0,
                    maxLines: 1,
                    isTitle: true,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
