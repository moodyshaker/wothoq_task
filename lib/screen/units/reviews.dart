import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../core/localization/demo_localization.dart';
import '../../model/product_model.dart';
import '../../providers/providers.dart';
import '../../widgets/main_text.dart';

class Review extends StatelessWidget {
  final ProductModel data;

  const Review({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final demo = DemoLocalization.of(context);
    return Column(
      children: List.generate(
        data.reviews!.length,
        (n) => Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    MainText(
                      text: data.reviews![n].userName,
                      font: 15.sp,
                      weight: FontWeight.bold,
                    ),
                    Row(
                      children: List.generate(
                          5,
                          (i) => i < data.reviews![n].rate!
                              ? Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 17,
                                )
                              : Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                  size: 17,
                                )),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(height: 10.h,),
                MainText(
                  text: data.reviews![n].review,
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MainText(
                      text: data.reviews![n].createdAt!,
                      font: 14.sp,
                      weight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
