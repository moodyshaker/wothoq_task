import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../model/product_model.dart';

final productProvider =
    FutureProvider<ProductModel?>((ref) => getProductModel());

final currentIndexProvider = StateProvider<int>((ref) => 0);

final currentSwitchProvider = StateProvider<int>((ref) => 0);

final cartQuantity = StateProvider<int>((ref) => 0);

final languageProvider = StateProvider<Locale>((ref) => Locale('en', 'US'));

Future<ProductModel?> getProductModel() async {
  try {
    Response response = await get(Uri.parse(
        'https://run.mocky.io/v3/1243be15-efd5-4132-9bd0-eeb33f325f51'));
    ProductModel productModel =
        ProductModel.fromJson(jsonDecode(response.body));
    return productModel;
  } catch (e) {
    log(e.toString());
  }
}
