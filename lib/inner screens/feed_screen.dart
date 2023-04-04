import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/back_widget.dart';
import 'package:grocery_app/widgets/feed_items.dart';

import '../widgets/text_widget.dart';

class FeedScreen extends StatefulWidget {
  static const routeName = '/_FeedScreenState';

  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final TextEditingController searchTextController = TextEditingController();
  final FocusNode searchTextFocusNode = FocusNode();
  @override
  void dispose() {
    searchTextController.dispose();
    searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    final Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        leading: const BackWidget(),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: TextWidget(
          text: 'All Products',
          color: color,
          textSize: 20,
          isTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: kBottomNavigationBarHeight,
              child: TextField(
                controller: searchTextController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            color: Colors.greenAccent, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            color: Colors.greenAccent, width: 1)),
                    hintText: "What's in your mind?",
                    prefixIcon: const Icon(Icons.search),
                    suffix: IconButton(
                      onPressed: () {
                        searchTextController.clear();
                        searchTextFocusNode.unfocus();
                      },
                      icon: Icon(Icons.close,
                          color: searchTextFocusNode.hasFocus
                              ? Colors.red
                              : color),
                    )),
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: EdgeInsets.zero,
            childAspectRatio: size.width / (size.height * 0.59),
            children: List.generate(10, (index) {
              return const FeedsWidget();
            }),
          )
        ]),
      ),
    );
  }
}
