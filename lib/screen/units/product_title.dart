import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wothoq_task/constants.dart';
import 'package:wothoq_task/model/product_model.dart';
import 'package:wothoq_task/providers/providers.dart';
import 'package:wothoq_task/widgets/main_text.dart';

class ProductTitle extends StatelessWidget {
  final ProductModel data;

  const ProductTitle({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText(
            text: '${data.name}',
            maxLines: 2,
            font: 16.sp,
            weight: FontWeight.w700,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              data.onSale!
                  ? Row(
                      children: [
                        MainText(
                          text: '${data.salePrice} SAR',
                          font: 14.sp,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        MainText(
                          text: '${data.regularPrice} SAR',
                          decoration: TextDecoration.lineThrough,
                          font: 11.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        MainText(
                          text:
                              '${((data.salePrice! / data.regularPrice!) * 100).toStringAsFixed(1)}%',
                          font: 11.sp,
                          color: Colors.deepOrange,
                        ),
                      ],
                    )
                  : MainText(
                      text: '${data.regularPrice} SAR',
                      font: 14.sp,
                    ),
              Row(
                children: [
                  Row(
                    children: List.generate(
                        5,
                        (i) => data.rate! > i
                            ? Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              )
                            : Icon(
                                Icons.star_border,
                                color: Colors.yellow,
                                size: 15,
                              )),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  MainText(
                    text: '(${data.numUsersRate})',
                    font: 12.sp,
                    color: Colors.grey,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(35.r),
                child: FancyShimmerImage(
                  imageUrl: data.store!.logo!,
                  height: 70.h,
                  width: 70.w,
                  boxFit: BoxFit.fill,
                  errorWidget: Image.asset(
                    getAsset('i'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(
                    text: data.store!.name!.toUpperCase(),
                    font: 18.sp,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.location_solid,
                        color: Colors.deepOrange,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      MainText(
                        text: data.store!.fullAddress,
                        font: 14.sp,
                        color: Colors.grey,
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
