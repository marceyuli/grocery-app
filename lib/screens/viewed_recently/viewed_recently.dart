import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/providers/viewed_prod_provider.dart';
import 'package:grocery_app/screens/viewed_recently/viewed_widget.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/back_widget.dart';
import 'package:grocery_app/widgets/empty_screen.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const routeName = '/ViewedScreenState';
  const ViewedRecentlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    final viewedProvider = Provider.of<ViewedProdProvider>(context);
    final viewdedProdItemList =
        viewedProvider.getViewedProdListItems.values.toList().reversed.toList();
    return viewdedProdItemList.isEmpty
        ? EmptyScreen(
            imagePath: 'assets/images/history.png',
            title: 'Your history is empty',
            subtitle: 'No products has been viewed yet!',
            buttontext: 'Shop now')
        : Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      GlobalMethods().warningDialog(
                          title: 'Empty your history?',
                          subtitle: 'Are you sure?',
                          fct: () {},
                          context: context);
                    },
                    icon: Icon(
                      IconlyBroken.delete,
                      color: color,
                    ))
              ],
              leading: const BackWidget(),
              automaticallyImplyLeading: false,
              elevation: 0,
              centerTitle: true,
              title: TextWidget(text: 'History', color: color, textSize: 24.0),
              backgroundColor:
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
            ),
            body: ListView.builder(
                itemCount: viewdedProdItemList.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: ChangeNotifierProvider.value(
                        value: viewdedProdItemList[index],
                        child: ViewedRecentlyWidget()),
                  );
                }),
          );
  }
}
