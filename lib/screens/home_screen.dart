import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/consts/consts.dart';
import 'package:grocery_app/inner%20screens/feed_screen.dart';
import 'package:grocery_app/inner%20screens/on_sale_screen.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/services/dark_theme_prefs.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/feed_items.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../models/products_model.dart';
import '../providers/products_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;

    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    final productsProvider = Provider.of<ProductsProvider>(context);
    List<ProductModel> allProducts = productsProvider.getProducts;
    List<ProductModel> productsOnSale = productsProvider.getProductsOnSale;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Center(
                  child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    Consts().offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: Consts().offerImages.length,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red)),
              )),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
                onPressed: () {
                  GlobalMethods().navigateTo(
                      ctx: context, routeName: OnSaleScreen.routeName);
                },
                child: TextWidget(
                  text: 'View All',
                  color: Colors.blue,
                  textSize: 20,
                  maxLines: 1,
                )),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'On sale'.toUpperCase(),
                        color: Colors.red,
                        textSize: 22,
                        isTitle: true,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(IconlyLight.discount, color: Colors.red)
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                        itemCount: productsOnSale.length <10 ? productsOnSale.length : 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return ChangeNotifierProvider.value(
                              value: productsOnSale[index],
                              child: const OnSaleWidget());
                        }),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Our products',
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  TextButton(
                      onPressed: () {
                        GlobalMethods().navigateTo(
                            ctx: context, routeName: FeedScreen.routeName);
                      },
                      child: TextWidget(
                          text: 'Browse All',
                          maxLines: 1,
                          color: Colors.blue,
                          textSize: 20))
                ],
              ),
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              //crossAxisSpacing: 10,
              childAspectRatio: size.width > 0 && size.height > 0
                  ? size.width / (size.height * 0.6)
                  : 1.0,
              children: List.generate(
                  allProducts.length < 4 ? allProducts.length : 4, (index) {
                return ChangeNotifierProvider.value(
                  value: allProducts[index],
                  child: const FeedsWidget(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
