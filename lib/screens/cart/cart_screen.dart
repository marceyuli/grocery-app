import "package:flutter/material.dart";
import "package:flutter_iconly/flutter_iconly.dart";
import "package:grocery_app/widgets/text_widget.dart";

import "../../services/utils.dart";
import "cart_widget.dart";

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: TextWidget(
              text: 'Cart Screen',
              color: color,
              isTitle: true,
              textSize: 22,
            ),
            actions: [
              IconButton(
                  onPressed: () {},
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
                  itemCount: 10,
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
