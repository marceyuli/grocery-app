import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/inner%20screens/product_details.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return ListTile(
      subtitle: const Text('Paid: \$12.8'),
      onTap: () {
        GlobalMethods().navigateTo(
            ctx: context, routeName: ProductDetailsScreen.routeName);
      },
      leading: FancyShimmerImage(
          width: size.width * 0.2,
          imageUrl:
              'https://purepng.com/public/uploads/large/purepng.com-apricotapricotfruitfreshorangeapricotsume-481521304824jpk3y.png',
          boxFit: BoxFit.fill,
        ),
      title: TextWidget(text: 'Title x12', color: color, textSize: 18),
      trailing: TextWidget(
        text: '06/04/2023',
        color: color,
        textSize: 18,
      ),
    );
  }
}
