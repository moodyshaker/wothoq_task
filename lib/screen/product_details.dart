import 'dart:convert';
import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:wothoq_task/constants.dart';
import 'package:wothoq_task/screen/units/cart_counter.dart';
import 'package:wothoq_task/screen/units/product_description.dart';
import 'package:wothoq_task/screen/units/product_details_reviews.dart';
import 'package:wothoq_task/screen/units/product_image.dart';
import 'package:wothoq_task/screen/units/product_title.dart';
import '../model/product_model.dart';
import '../providers/providers.dart';
import '../widgets/main_text.dart';

class ProductDetails extends ConsumerWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productProvider);
    return Scaffold(
      body: data.when(
        data: (ProductModel? data) => SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ProductImage(data: data!),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        )),
                    margin: EdgeInsets.only(top: 380.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ProductTitle(data: data),
                        SizedBox(height: 10.h,),
                        ProductDescription(data: data),
                        SizedBox(height: 10.h,),
                        ProductDetailsreviews(data: data),
                        SizedBox(height: 30.h,),
                        CartCounter(data: data),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        error: (error, stack) => MainText(text: 'error has occurred'),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
