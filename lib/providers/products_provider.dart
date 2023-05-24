import 'package:flutter/material.dart';

import '../models/products_model.dart';

class ProductsProvider  with ChangeNotifier{
  List<ProductModel> get getProducts {
    return productsList;
  }
  static List<ProductModel> productsList = [
    ProductModel(
        id: 'Apricot',
        title: 'Apricot',
        imageUrl:
            'https://purepng.com/public/uploads/large/purepng.com-apricotapricotfruitfreshorangeapricotsume-481521304824jpk3y.png',
        productCategoryName: 'Fruits',
        price: 0.99,
        salePrice: 0.75,
        isOnSale: true,
        isPiece: true),
    ProductModel(
        id: 'Apple',
        title: 'Apple',
        imageUrl:
            'https://pngimg.com/d/apple_PNG12436.png',
        productCategoryName: 'Fruits',
        price: 0.99,
        salePrice: 0.75,
        isOnSale: true,
        isPiece: true),
    ProductModel(
        id: 'Grapes',
        title: 'Grapes',
        imageUrl:
            'https://i.pinimg.com/originals/29/d1/c0/29d1c0557252e29da83a2110122c3e98.png',
        productCategoryName: 'Fruits',
        price: 0.99,
        salePrice: 0.75,
        isOnSale: true,
        isPiece: false),
    ProductModel(
        id: 'Carrot',
        title: 'Carrot',
        imageUrl:
            'https://pngimg.com/d/carrot_PNG99145.png',
        productCategoryName: 'Vegetables',
        price: 0.99,
        salePrice: 0.75,
        isOnSale: true,
        isPiece: false),
  ];
}