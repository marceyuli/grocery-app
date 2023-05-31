import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/providers/wishlist_provider.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:provider/provider.dart';

class HeartBtn extends StatelessWidget {
  const HeartBtn(
      {super.key, required this.productId, required this.isInWishlist});
  final String productId;
  final bool? isInWishlist;
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    final Color color = Utils(context).color;
    return GestureDetector(
        onTap: () {
          wishlistProvider.addRemoveProductToTheWishlist(productId: productId);
        },
        child: Icon(
          isInWishlist != null && isInWishlist == true ? IconlyBold.heart:
          IconlyLight.heart,
          size: 22,
          color: isInWishlist != null && isInWishlist == true ? Colors.red : color,
        ));
  }
}
