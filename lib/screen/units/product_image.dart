import 'dart:math';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wothoq_task/model/product_model.dart';

import '../../constants.dart';
import '../../providers/providers.dart';

class ProductImage extends StatelessWidget {
  final ProductModel data;

  const ProductImage({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      child: Consumer(builder: (
        BuildContext context,
        WidgetRef ref,
        Widget? child,
      ) {
        final currentIndex = ref.watch(currentIndexProvider);
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                    onPageChanged: (int i) {
                      ref.read(currentIndexProvider.notifier).state = i;
                    },
                    itemCount: data.images!.length,
                    itemBuilder: (BuildContext ctx, int i) => FancyShimmerImage(
                          imageUrl: data.images![i].img!,
                          errorWidget: Image.asset(
                            getAsset('i'),
                            fit: BoxFit.fill,
                          ),
                        )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      data.images!.length,
                      (i) => Container(
                            margin: EdgeInsets.only(left: 10.w, bottom: 30.h),
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == i
                                    ? Colors.deepOrange
                                    : Colors.grey),
                          )),
                )
              ],
            ),
            SafeArea(
              child: Row(
                children: [
                  Container(
                    padding: ref
            .read(languageProvider.notifier)
            .state
            .languageCode ==
        'ar' ? EdgeInsets.only(right: 20.w) : EdgeInsets.only(left: 20.w),
                    child: Transform.rotate(
                      angle: ref
                          .read(languageProvider.notifier)
                          .state
                          .languageCode ==
                          'ar' ? pi : 0,
                      child: Icon(
                        Icons.arrow_back_outlined,
                        size: 30,
                      ),
                    ),
                    height: 40.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: ref
                                      .read(languageProvider.notifier)
                                      .state
                                      .languageCode ==
                                  'ar'
                              ? Radius.circular(0.r)
                              : Radius.circular(50.r),
                          topLeft: ref
                                      .read(languageProvider.notifier)
                                      .state
                                      .languageCode ==
                                  'ar'
                              ? Radius.circular(50.r)
                              : Radius.circular(0.r),
                          bottomLeft: ref
                                      .read(languageProvider.notifier)
                                      .state
                                      .languageCode ==
                                  'ar'
                              ? Radius.circular(50.r)
                              : Radius.circular(0.r),
                          bottomRight: ref
                              .read(languageProvider.notifier)
                              .state
                              .languageCode ==
                              'ar'
                              ? Radius.circular(0.r)
                              : Radius.circular(50.r),
                        )),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: ()async{
                    },
                    child: Container(
                      child: Icon(
                        Icons.share_outlined,
                      ),
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(languageProvider.notifier).state.languageCode ==
                              'ar'
                          ? ref.read(languageProvider.notifier).state =
                              Locale('en', 'US')
                          : ref.read(languageProvider.notifier).state =
                              Locale('ar', 'EG');
                    },
                    child: Container(
                      child: Icon(
                        Icons.favorite_border,
                      ),
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
