import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:wothoq_task/providers/providers.dart';
import '../../constants.dart';
import '../../core/localization/demo_localization.dart';
import '../../model/product_model.dart';
import '../../widgets/main_text.dart';
import '../../model/product_model.dart';
import '../../widgets/main_text.dart';
import 'details.dart';
import 'reviews.dart';

class ProductDetailsreviews extends StatelessWidget {
  final ProductModel data;

  const ProductDetailsreviews({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final demo = DemoLocalization.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r), color: Colors.white),
      child: Consumer(builder: (
        BuildContext context,
        WidgetRef ref,
        Widget? child,
      ) {
        final index = ref.watch(currentSwitchProvider);
        log('${index}');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ref.read(currentSwitchProvider.notifier).state = 0;
                        log('g');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Column(
                          children: [
                            MainText(
                              text: '${demo.getTranslatedValue('details')}',
                              font: 18.sp,
                              weight: FontWeight.w700,
                              color:
                                  index == 0 ? Colors.deepOrange : Colors.black,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Container(
                              color: index == 0
                                  ? Colors.deepOrange
                                  : Colors.transparent,
                              height: 3.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ref.read(currentSwitchProvider.notifier).state = 1;
                        log('${ref.read(currentSwitchProvider.notifier).state}');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Column(
                          children: [
                            MainText(
                              text: '${demo.getTranslatedValue('review')}',
                              font: 18.sp,
                              weight: FontWeight.w700,
                              color:
                                  index == 1 ? Colors.deepOrange : Colors.black,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Container(
                              color: index == 1
                                  ? Colors.deepOrange
                                  : Colors.transparent,
                              height: 3.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            index == 0 ? Details(data: data) : Review(data: data)
          ],
        );
      }),
    );
  }
}
