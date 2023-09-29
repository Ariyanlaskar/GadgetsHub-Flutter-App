// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning/Widgets/details_page.dart';
// import 'package:learning/Widgets/Codepur/homepage.dart';
import 'package:learning/Widgets/list.dart';
import 'package:learning/functioalities.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    Brightness bright = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: bright == Brightness.light
                ? Brightness.dark
                : Brightness.light),
        title: Padding(
          padding: const EdgeInsets.only(right: 53),
          child: Center(
              child: Text(
            'Cart',
            style: TextStyle(
                fontSize: 23,
                color: Theme.of(context).textTheme.bodyLarge!.color),
          )),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          children: [
            Expanded(
                child: cataList.ListItem.isNotEmpty
                    ? cartList(bright)
                    : const Center(
                        child: Text(
                        'Your Cart Is Empty',
                        style: TextStyle(fontSize: 27),
                      ))),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 19),
              child: cartTotal(context),
            ),
          ],
        ),
      ),
    );
  }

  ListView cartList(Brightness bright) {
    return ListView.builder(
      itemCount: cataList.ListItem.length,
      itemBuilder: (BuildContext context, int index) {
        num price = cataList.ListItem[index].price *
            (cataList.count[cataList.ListItem[index].id]!.toInt());
        return Padding(
          padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(27)),
            height: MediaQuery.of(context).size.height / 6,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          detailsPage(cata: cataList.ListItem[index]),
                    ));
              },
              child: Card(
                elevation: 0.5,
                color: Theme.of(context).canvasColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    children: [
                      Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).cardColor,
                                  ),
                                  padding: const EdgeInsets.all(3),
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: Image.network(
                                      cataList.ListItem[index].image)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cataList.ListItem[index].name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          'Quantity : ${cataList.count[cataList.ListItem[index].id]}'),
                                      Text('Price : \$$price')
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            addToCart(cataList.ListItem[index]);
                                            setState(() {});
                                          },
                                          icon: const Icon(Icons.add)),
                                      IconButton(
                                          onPressed: () {
                                            // addToCart(cataList.ListItem[index]);
                                            setState(() {
                                              cataList.removeItem(
                                                  cataList.ListItem[index]);
                                            });
                                          },
                                          icon: const Icon(Icons.remove)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ]),
                      bright == Brightness.dark
                          ? const Divider(
                              color: Color.fromARGB(255, 132, 131, 131),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Row cartTotal(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${getCartTotal()}',
          style: const TextStyle(fontSize: 19.7),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(100, 43)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  duration: const Duration(milliseconds: 900),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor:
                      Theme.of(context).snackBarTheme.backgroundColor,
                  content: const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Buying Option is Not Supported Yet!!!',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )));
            },
            child: const Text('Buy Now'))
      ],
    );
  }
}

// // ignore: camel_case_types
// class cartTotal extends StatefulWidget {
//   cartTotal({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<cartTotal> createState() => cartTotalState();
// }

// class cartTotalState extends State<cartTotal> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           '\$${9999}',
//           style: TextStyle(fontSize: 19.7),
//         ),
//         ElevatedButton(
//             style: ElevatedButton.styleFrom(minimumSize: Size(100, 43)),
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   padding: EdgeInsets.symmetric(vertical: 22),
//                   duration: Duration(milliseconds: 900),
//                   behavior: SnackBarBehavior.floating,
//                   backgroundColor:
//                       Theme.of(context).snackBarTheme.backgroundColor,
//                   content: Padding(
//                     padding: const EdgeInsets.only(left: 15),
//                     child: Text(
//                       'Buying Option is Not Supported Yet!!!',
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   )));
//             },
//             child: Text('Buy Now'))
//       ],
//     );
//   }
// }

// ignore: camel_case_types, must_be_immutable
// class cartList extends StatefulWidget {
//   cartList({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<cartList> createState() => cartListState();
// }

// class cartListState extends State<cartList> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: cataList.ListItem.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: ListTile(
//             tileColor: Theme.of(context).cardColor,
//             leading: Container(
//                 width: MediaQuery.of(context).size.width / 10,
//                 child: Image.network(cataList.ListItem[index].image)),
//             title: Text(
//                 '${cataList.ListItem[index].name} : ${cataList.count[cataList.ListItem[index].id]}'),
//             trailing: IconButton(
//                 onPressed: () {
//                   addToCart(cataList.ListItem[index]);
//                   setState(() {});
//                 },
//                 icon: Icon(Icons.add)),
//           ),
//         );
//       },
//     );
//   }
// }
