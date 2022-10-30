import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/localization/demo_localization.dart';
import '../../model/product_model.dart';
import '../../providers/providers.dart';
import '../../widgets/main_text.dart';

class Details extends StatelessWidget {
  final ProductModel data;
  const Details({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final demo = DemoLocalization.of(context);
    return Consumer(
      builder: (
        BuildContext context,
        WidgetRef ref,
        Widget? child,
      ) {
        final local = ref.watch(languageProvider);
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainText(
                    text: '${demo.getTranslatedValue('quantity')}',
                    font: 16.sp,
                    weight: FontWeight.w500,
                  ),
                  MainText(
                    text: '${data.stock}',
                    font: 16.sp,
                    weight: FontWeight.w500,
                  )
                ],
              ),
            ),
            Column(
                children: List.generate(
              data.productDetails!.length,
              (i) => Container(
                decoration: BoxDecoration(
                  color: i % 2 != 0 ? Colors.white : Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainText(
                      text: local.languageCode == 'ar'
                          ? data.productDetails![i].nameAr
                          : data.productDetails![i].nameEn,
                      font: 16.sp,
                      weight: FontWeight.w500,
                    ),
                    MainText(
                      text: data.productDetails![i].value,
                      font: 16.sp,
                      weight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            )),
          ],
        );
      },
    );
  }
}
