import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning/Widgets/Cart.dart';
import 'package:learning/Widgets/details_page.dart';
import 'package:learning/Widgets/theme.dart';
import 'package:learning/Widgets/Models/catalog.dart';
import 'package:learning/functioalities.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'log_in.dart';

// ignore: camel_case_types, must_be_immutable
class homePage extends StatefulWidget {
  String keylog;
  homePage({
    Key? key,
    required this.keylog,
  }) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

// ignore: camel_case_types
class _homePageState extends State<homePage> {
  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    Brightness bright = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: bright == Brightness.light
            ? MyTheme.darkBluishColor
            : MyTheme.lightBluishColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
        },
        child: const Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: bright == Brightness.light
                ? MyTheme.creamColor
                : Theme.of(context).canvasColor,
            statusBarIconBrightness:
                bright == Brightness.dark ? Brightness.light : Brightness.dark),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(),
            if (catalog.catalogs.isNotEmpty)
              Expanded(
                  child: ListWidget(
                bright: bright,
              ))
            else
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      )),
    );
  }

  // ignore: non_constant_identifier_names
  Column HeaderWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Gadgets Hub',
              style: TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).highlightColor),
            ),
            IconButton(
                onPressed: () {
                  logout();
                },
                icon: const Icon(Icons.logout_outlined))
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            'Trending Products',
            style: TextStyle(fontSize: 19.6),
          ),
        )
      ],
    );
  }

  void loadJson() async {
    await Future.delayed(const Duration(seconds: 2));
    var loadJson = await rootBundle.loadString('assets/files/catalog.json');
    var decodedData = jsonDecode(loadJson);
    var catalogData = decodedData["products"];
    catalog.catalogs = List.from(catalogData)
        .map<catalog>((cats) => catalog.fromMap(cats))
        .toList();
    setState(() {});
  }

  void logout() async {
    var pref = await SharedPreferences.getInstance();
    pref.setBool(widget.keylog, false);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LogIn(
            logkey: widget.keylog,
          ),
        ));
  }
}

// ignore: must_be_immutable
class ListWidget extends StatelessWidget {
  Brightness bright;
  ListWidget({
    Key? key,
    required this.bright,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: catalog.catalogs.length,
      itemBuilder: (context, index) {
        final cata = catalog.catalogs[index];

        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => detailsPage(cata: cata)));
            },
            child: Hero(
                tag: cata.name,
                child: (itemBuilder(
                  cat: cata,
                  bright: bright,
                ))));
      },
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class itemBuilder extends StatelessWidget {
  final catalog cat;
  Brightness bright;

  itemBuilder({super.key, required this.cat, required this.bright});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 140,
        // width: 10,
        child: Card(
          color: Theme.of(context).cardColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              ImageSec(cat: cat, context: context),
              titleSec(cat: cat, bright: bright),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageSec extends StatelessWidget {
  const ImageSec({
    super.key,
    required this.cat,
    required this.context,
  });

  final catalog cat;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.5),
      child: Container(
        // color: Theme.of(context).canvasColor,
        height: 110,
        width: MediaQuery.of(context).size.height / 7.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).canvasColor,
        ),
        child: Image.network(
          cat.image,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class titleSec extends StatelessWidget {
  titleSec({super.key, required this.cat, required this.bright});

  final catalog cat;
  Brightness bright;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cat.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).highlightColor,
                fontSize: 17),
          ),
          Text(
            cat.desc,
            style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).textTheme.bodySmall!.color),
          ),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${cat.price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.5),
                ),
                Container(
                  // color: MyTheme.darkBluishColor,
                  height: 40,
                  width: 100,

                  decoration: const BoxDecoration(
                      // color: Colors.red,
                      ),
                  child: ElevatedButton(
                    onPressed: () {
                      addToCart(cat);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          padding: const EdgeInsets.all(20),
                          behavior: SnackBarBehavior.fixed,
                          duration: const Duration(milliseconds: 900),
                          backgroundColor:
                              Theme.of(context).snackBarTheme.backgroundColor,
                          content: const Text("Item Added To Card",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16))));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19)),
                        backgroundColor: bright == Brightness.light
                            ? MyTheme.darkBluishColor
                            : MyTheme.lightBluishColor),
                    child: const Text(
                      'Add To Cart',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
