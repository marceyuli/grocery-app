import 'package:flutter/material.dart';
import 'package:grocery_app/screens/orders/orders_widget.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/back_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/OrdersScreenState';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackWidget(),
        elevation: 0,
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
        title: TextWidget(
          text: 'Orders Screen',
          color: color,
          isTitle: true,
          textSize: 22,
        ),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
            child: OrderWidget(),
          );
        },
        separatorBuilder: (BuildContext context, index) {
          return Divider(
            color: color,
            thickness: 1,
          );
        },
      ),
    );
  }
}
