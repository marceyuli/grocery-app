import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/models/products_model.dart';
import 'package:grocery_app/providers/products_provider.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/back_widget.dart';
import 'package:grocery_app/widgets/empty_prods_widget.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScren";
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    List<ProductModel> productsOnSale = productsProvider.getProductsOnSale;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
        appBar: AppBar(
          leading: const BackWidget(),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Products on sale',
            color: color,
            textSize: 24,
            isTitle: true,
          ),
        ),
        body: productsOnSale.isEmpty
            ? const EmptyProdWiget(text: 'No products on sale yet! \n Stay tuned')
            : GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.zero,
                childAspectRatio: size.width / (size.height * 0.45),
                children: List.generate(productsOnSale.length, (index) {
                  return ChangeNotifierProvider.value(
                    value: productsOnSale[index],
                    child: const OnSaleWidget());
                }),
              ));
  }
}
