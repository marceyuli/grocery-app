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
    notifyListeners();
  }

  bool get isCartEmpty {
    return cartItems.isEmpty;
  }

  void reduceQuantityByOne(String productId) {
    cartItems.update(
        productId,
        (value) => CartModel(
            id: value.id, productId: productId, quantity: value.quantity - 1));
    notifyListeners();
  }

  void increaseQuantityByOne(String productId) {
    cartItems.update(
        productId,
        (value) => CartModel(
            id: value.id, productId: productId, quantity: value.quantity + 1));
    notifyListeners();
  }

  void removeOneItem(String productId) {
    cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }
}
