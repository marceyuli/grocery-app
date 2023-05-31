import 'package:flutter/cupertino.dart';
import 'package:grocery_app/models/wishlist_model.dart';

class WishlistProvider with ChangeNotifier {
  Map<String, WishlistModel> wishlistItems = {};

  Map<String, WishlistModel> get getWishlistItems {
    return wishlistItems;
  }

  void addRemoveProductToTheWishlist({required String productId}) {
    if (wishlistItems.containsKey(productId)) {
      removeOneItem(productId);
    } else {
      wishlistItems.putIfAbsent(
          productId,
          () => WishlistModel(
              id: DateTime.now().toString(), productId: productId));
    }
    notifyListeners();
  }

  void removeOneItem(String productId) {
    wishlistItems.remove(productId);
    notifyListeners();
  }

  void clearWishlist() {
    wishlistItems.clear();
    notifyListeners();
  }
}
