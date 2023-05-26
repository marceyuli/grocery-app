import "package:flutter/material.dart";
import "package:flutter_iconly/flutter_iconly.dart";
import 'package:grocery_app/widgets/empty_screen.dart';
import "package:grocery_app/services/global_methods.dart";
import "package:grocery_app/widgets/text_widget.dart";
import "package:provider/provider.dart";

import "../../providers/cart_provider.dart";
import "../../services/utils.dart";
import "cart_widget.dart";

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.getCartItems.values.toList();
    return cartProvider.isCartEmpty
        ? const EmptyScreen(
            title: 'Your cart is empty',
            subtitle: 'Add something and make me happy :)',
            buttontext: 'Shop now',
            imagePath: 'assets/images/cart.png',
          )
        : Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: TextWidget(
                  text: 'Cart ${cartItems.length}',
                  color: color,
                  isTitle: true,
                  textSize: 22,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        GlobalMethods().warningDialog(
                            title: 'Empty your cart?',
                            subtitle: 'Are you sure?',
                            fct: () {},
                            context: context);
                      },
                      icon: Icon(
                        IconlyBroken.delete,
                        color: color,
                      ))
                ]),
            body: Column(
              children: [
                checkout(ctx: context),
                Expanded(
                  child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (ctx, index) {
                        return CartWidget();
                      }),
                ),
              ],
            ));
  }

  Widget checkout({required BuildContext ctx}) {
    final Color color = Utils(ctx).color;
    Size size = Utils(ctx).getScreenSize;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(children: [
          Material(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                      text: 'Order Now', color: Colors.white, textSize: 20),
                )),
          ),
          const Spacer(),
          FittedBox(
            child: TextWidget(
              text: 'Total \$0.259',
              color: color,
              textSize: 18,
              isTitle: true,
            ),
          )
        ]),
      ),
    );
  }
}
