// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning/Widgets/theme.dart';
import 'package:learning/functioalities.dart';

import 'Models/catalog.dart';

// ignore: camel_case_types
class detailsPage extends StatelessWidget {
  final catalog cata;
  const detailsPage({super.key, required this.cata});

  @override
  Widget build(BuildContext context) {
    Brightness bright = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: appBar(bright, context),
      bottomNavigationBar: bottomNavBar(
        cata: cata,
        bright: bright,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          ImageSec(cata: cata),
          DetailSec(cata: cata),
        ],
      )),
    );
  }

  AppBar appBar(bright, context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              bright == Brightness.light ? Brightness.dark : Brightness.light),
      toolbarHeight: 49,
      elevation: 0,
      iconTheme:
          IconThemeData(color: Theme.of(context).appBarTheme.iconTheme!.color),
      backgroundColor: Colors.transparent,
    );
  }
}

class DetailSec extends StatelessWidget {
  const DetailSec({
    super.key,
    required this.cata,
  });

  final catalog cata;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Arc(
        edge: Edge.TOP,
        arcType: ArcType.CONVEY,
        height: 36.4,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 55.0, left: 20, right: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Text(
                    cata.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        fontSize: 21.5),
                  ),
                  Text(
                    cata.desc,
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).textTheme.bodyMedium!.color),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: Text(
                      "Stet ea et elitr voluptua diam duo eos et erat dolor, diam invidunt et dolore ea dolore stet accusam elitr sed. Justo rebum kasd et kasd, eos tempor dolores sed duo et sit sea gubergren tempor, amet dolores stet amet Justo rebum.",
                      style: TextStyle(
                          fontSize: 14.6,
                          color: Theme.of(context).textTheme.bodyMedium!.color),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageSec extends StatelessWidget {
  const ImageSec({
    super.key,
    required this.cata,
  });

  final catalog cata;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Hero(
          tag: cata.name,
          child: Image.network(
            cata.image,
            height: MediaQuery.of(context).size.height / 3.2,
            width: double.infinity,
          )),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class bottomNavBar extends StatelessWidget {
  bottomNavBar({Key? key, required this.cata, required this.bright})
      : super(key: key);

  final catalog cata;
  Brightness bright;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 18, left: 33, right: 33, top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${cata.price}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.redAccent.shade700),
            ),
            Container(
              height: 40,
              width: 115,
              decoration: const BoxDecoration(),
              child: ElevatedButton(
                onPressed: () {
                  addToCart(cata);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      padding: const EdgeInsets.all(20),
                      behavior: SnackBarBehavior.fixed,
                      duration: const Duration(milliseconds: 900),
                      backgroundColor:
                          Theme.of(context).snackBarTheme.backgroundColor,
                      content: const Text("Item Added To Card",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16))));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19)),
                    backgroundColor: bright == Brightness.light
                        ? MyTheme.darkBluishColor
                        : MyTheme.lightBluishColor),
                child: const Text('Add To Cart'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
