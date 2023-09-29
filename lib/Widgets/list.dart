import 'dart:collection';
// import 'dart:ffi';

// import 'package:flutter/material.dart';
import 'package:learning/Widgets/Models/catalog.dart';

// ignore: camel_case_types
class cataList {
  // ignore: non_constant_identifier_names
  static List<catalog> ListItem = [];
  static Map<int, int> count = HashMap();

  static int getSum() {
    int countSum = 0;
    for (int i = 0; i < ListItem.length; i++) {
      countSum += cataList.count[ListItem[i].id]! * ListItem[i].price;
    }
    return countSum;
  }

  static void removeItem(catalog cat) {
    if (cataList.count[cat.id]! > 1) {
      cataList.count[cat.id] = cataList.count[cat.id]! - 1;
    } else if (cataList.count[cat.id] == 1) {
      cataList.ListItem.remove(cat);
    }
  }
}
