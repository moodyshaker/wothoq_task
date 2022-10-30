import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wothoq_task/providers/providers.dart';
import 'package:wothoq_task/widgets/main_text.dart';

import '../../model/product_model.dart';

class CartCounter extends StatelessWidget {
  final ProductModel data;

  const CartCounter({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 40.h),
          width: 350.w,
          child: Consumer(builder: (
            BuildContext context,
            WidgetRef ref,
            Widget? child,
          ) {
            final quantity = ref.watch(cartQuantity);
            return Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 40.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (ref.read(cartQuantity.notifier).state > 0) {
                                ref.read(cartQuantity.notifier).state--;
                              }
                            },
                            icon: Icon(
                              Icons.remove_circle_outlined,
                              color: Colors.white,
                            )),
                        MainText(
                          text: '$quantity',
                          color: Colors.white,
                        ),
                        IconButton(
                            onPressed: () {
                              if (ref.read(cartQuantity.notifier).state <
                                  data.stock!) {
                                ref.read(cartQuantity.notifier).state++;
                              }
                            },
                            icon: Icon(
                              Icons.add_circle_outlined,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      ref.read(cartQuantity.notifier).state = 0;
                    },
                    child: Container(
                        height: 45.h,
                        width: 180.w,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.r),
                                bottomRight: Radius.circular(20.r))),
                        child: Center(
                          child: MainText(
                            text: 'Add to cart'.toUpperCase(),
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ],
            );
          }),
        )
      ],
    );
  }
}
