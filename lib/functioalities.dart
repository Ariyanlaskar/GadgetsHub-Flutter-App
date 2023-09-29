// import 'package:flutter/material.dart';
import 'package:learning/Widgets/list.dart';

//Adding Item To Cart
addToCart(cat) {
  int count = 0;

  for (var ind in cataList.ListItem) {
    if (ind.id == cat.id) {
      count++;
    }
  }
  if (count > 0) {
    cataList.count[cat.id] = cataList.count[cat.id]! + 1;
  }

  if (count <= 0) {
    cataList.count.addAll({cat.id: count + 1});
    cataList.ListItem.add(cat);
  }
}

// Getting Total Sum Of Cart Items

getCartTotal() {
  int sum = cataList.getSum();
  return sum;
}
