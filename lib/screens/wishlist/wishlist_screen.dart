import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/screens/wishlist/wishlist_widget.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/widgets/back_widget.dart';

import '../../services/utils.dart';
import '../../widgets/text_widget.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreenState';
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: const BackWidget(),
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: TextWidget(
              text: 'Wishlist Screen',
              color: color,
              isTitle: true,
              textSize: 22,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    GlobalMethods().warningDialog(
                        title: 'Empty your wishlist?',
                        subtitle: 'Are you sure?',
                        fct: () {},
                        context: context);
                  },
                  icon: Icon(
                    IconlyBroken.delete,
                    color: color,
                  ))
            ]),
        body: MasonryGridView.count(
          crossAxisCount: 2,
          /*mainAxisSpacing: 4,
          crossAxisSpacing: 4,*/
          itemBuilder: (context, index) {
            return const WishlistWidget();
          },
        ));
  }
}
