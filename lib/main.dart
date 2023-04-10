import 'package:flutter/material.dart';
import 'package:grocery_app/consts/theme_data.dart';
import 'package:grocery_app/inner%20screens/feed_screen.dart';
import 'package:grocery_app/inner%20screens/on_sale_screen.dart';
import 'package:grocery_app/inner%20screens/product_details.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/screens/btm_bar.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/orders/orders_screen.dart';
import 'package:grocery_app/screens/user.dart';
import 'package:grocery_app/screens/viewed_recently/viewed_recently.dart';
import 'package:grocery_app/screens/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: BottomBarScreen(),
            routes: {
              OnSaleScreen.routeName: (ctx) => const OnSaleScreen(),
              FeedScreen.routeName: (ctx) => const FeedScreen(),
              ProductDetailsScreen.routeName: (ctx) =>
                  const ProductDetailsScreen(),
              WishlistScreen.routeName: (ctx) => const WishlistScreen(),
              OrdersScreen.routeName: (ctx) => const OrdersScreen(),
              ViewedRecentlyScreen.routeName: (ctx) => const ViewedRecentlyScreen(),
            });
      }),
    );
  }
}
