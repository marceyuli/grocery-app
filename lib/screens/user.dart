import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_iconly/flutter_iconly.dart";
import "package:grocery_app/consts/firebase_consts.dart";
import "package:grocery_app/screens/auth/login.dart";
import "package:grocery_app/screens/orders/orders_screen.dart";
import "package:grocery_app/screens/viewed_recently/viewed_recently.dart";
import "package:grocery_app/screens/wishlist/wishlist_screen.dart";
import "package:grocery_app/services/global_methods.dart";
import "package:grocery_app/widgets/text_widget.dart";
import "package:provider/provider.dart";

import "../provider/dark_theme_provider.dart";

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  final User? user = authInstance.currentUser;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Hi,   ',
                      style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                    TextSpan(
                        text: 'MyName',
                        style: TextStyle(
                            color: color,
                            fontSize: 25,
                            fontWeight: FontWeight.w600))
                  ])),
              TextWidget(text: 'Email@email.com', color: color, textSize: 18),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
              _listTiles(
                  title: 'Address 2',
                  subtitle: 'My subtitle',
                  icon: IconlyLight.profile,
                  onPressed: () async {
                    await _showAdressDialog();
                  },
                  color: color),
              _listTiles(
                  title: 'Orders',
                  icon: IconlyLight.bag,
                  onPressed: () {
                    GlobalMethods().navigateTo(
                        ctx: context, routeName: OrdersScreen.routeName);
                  },
                  color: color),
              _listTiles(
                  title: 'Wishlist',
                  icon: IconlyLight.heart,
                  onPressed: () {
                    GlobalMethods().navigateTo(
                        ctx: context, routeName: WishlistScreen.routeName);
                  },
                  color: color),
              _listTiles(
                  title: 'Viewed',
                  icon: IconlyLight.show,
                  onPressed: () {
                    GlobalMethods().navigateTo(
                        ctx: context,
                        routeName: ViewedRecentlyScreen.routeName);
                  },
                  color: color),
              _listTiles(
                  title: 'Forget Password',
                  icon: IconlyLight.unlock,
                  onPressed: () {},
                  color: color),
              SwitchListTile(
                title: TextWidget(
                  text: themeState.getDarkTheme ? 'Dark mode' : 'Light mode',
                  color: color,
                  textSize: 18,
                ),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined),
                onChanged: (bool value) {
                  setState(() {
                    themeState.setDarkTheme = value;
                  });
                },
                value: themeState.getDarkTheme,
              ),
              _listTiles(
                  title: user == null ? 'Login' : 'Logout',
                  icon: user == null ? IconlyLight.login : IconlyLight.logout,
                  onPressed: () async {
                    if (user == null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }
                    await GlobalMethods().warningDialog(
                        title: 'Sign out',
                        subtitle: 'Do you  wanna sign out?',
                        fct: () async {
                          await authInstance.signOut();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                        },
                        context: context);
                  },
                  color: color)
            ],
          ),
        )),
      ),
    );
  }

  Future<void> _showAdressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              // onChanged: (value) {
              //   //_addressTextController.text;
              // },
              controller: _addressTextController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Your Adress"),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Update'),
              ),
            ],
          );
        });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
        title:
            TextWidget(text: title, color: color, textSize: 22, isTitle: true),
        subtitle: TextWidget(
          text: subtitle == null ? "" : subtitle,
          color: color,
          textSize: 18,
        ),
        leading: Icon(icon),
        trailing: const Icon(IconlyLight.arrowRight2),
        onTap: () {
          onPressed();
        });
  }
}
