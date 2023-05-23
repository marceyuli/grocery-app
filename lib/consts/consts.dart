import 'package:grocery_app/models/products_model.dart';

class Consts {
  final List<String> offerImages = [
    'assets/images/offers/Offer1.jpg',
    'assets/images/offers/Offer2.jpg',
    'assets/images/offers/Offer3.jpg',
    'assets/images/offers/Offer4.jpg',
  ];
  final List<String> authImagesPaths = [
    'assets/images/landing/buy-on-laptop.jpg',
    'assets/images/landing/buy-through.png',
    'assets/images/landing/buyfood.jpg',
    'assets/images/landing/grocery-cart.jpg',
    'assets/images/landing/grocery-cart.jpg',
    'assets/images/landing/store.jpg',
    'assets/images/landing/vergtablebg.jpg'
  ];
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
