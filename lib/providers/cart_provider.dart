import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  Map<String, CartModel> cartItems = {};

  Map<String, CartModel> get getCartItems {
    return cartItems;
  }

  void addProductsToTheCart(
      {required String productId, required int quantity}) {
    cartItems.putIfAbsent(
        productId,
        () => CartModel(
            id: DateTime.now().toString(),
            productId: productId,
            quantity: quantity));
  }

  bool get isCartEmpty {
    return cartItems.isEmpty;
  }
}
