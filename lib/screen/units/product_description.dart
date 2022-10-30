import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../../model/product_model.dart';
import '../../widgets/main_text.dart';

class ProductDescription extends StatelessWidget {
  final ProductModel data;

  const ProductDescription({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r), color: Colors.white),
      child: MainText(
        text: '${data.desc}',
        maxLines: 2,
        font: 16.sp,
        weight: FontWeight.w700,
      ),
    );
  }
}
