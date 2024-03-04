import 'package:flutter/material.dart';

import 'package:sneakers_app/data/dummy_data.dart';
import 'package:sneakers_app/widget/snack_bar.dart';

import '../models/models.dart';

class AppMethods {
  AppMethods._();
  static void addToCart(ShoeModel data, BuildContext context) {
    bool contains = itemsOnBag.contains(data);

    if (contains == true) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(failedSnackBar());
    } else {
      itemsOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(successSnackBar());
    }
  }

  static double sumOfItemsOnBag(Map<ShoeModel, int> quantities) {
    double total = 0.0;
    for (var entry in quantities.entries) {
      total += entry.key.price * entry.value;
    }
    return total;
  }
}
