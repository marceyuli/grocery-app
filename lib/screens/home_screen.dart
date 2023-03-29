import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/services/dark_theme_prefs.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> _offerImages = [
      'assets/images/offers/Offer1.jpg',
      'assets/images/offers/Offer2.jpg',
      'assets/images/offers/Offer3.jpg',
      'assets/images/offers/Offer4.jpg',
    ];
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.33,
            child: Center(
                child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  _offerImages[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: _offerImages.length,
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
              onPressed: () {},
              child: TextWidget(
                text: 'View All',
                color: Colors.blue,
                textSize: 20,
                maxLines: 1,
              )),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            height: size.height * 0.24,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return OnSaleWidget();
                }),
          )
        ],
      ),
    );
  }
}
