import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  final String? text;
  final String? family;
  final double? font;
  final FontWeight? weight;
  final double verticalPadding, horizontalPadding;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final Color? color;
  final double? lineHeight;
  final int? maxLines;
  final bool? center;

  const MainText(
      {Key? key,
      this.text,
      this.font,
      this.overflow,
      this.lineHeight,
      this.decoration,
      this.verticalPadding = 0,
      this.horizontalPadding = 0,
      this.color,
      this.maxLines,
      this.weight,
      this.family,
      this.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: Text(text!,
          textAlign: center == true ? TextAlign.center : TextAlign.start,
          maxLines: maxLines,
          overflow: overflow,
          style: TextStyle(
            color: color ?? Colors.black,
            fontSize: font ?? 20.sp,
            height: lineHeight,
            decoration: decoration ?? TextDecoration.none,
            fontWeight: weight ?? FontWeight.w500,
            fontFamily: family ?? 'IBM',
          )),
    );
  }
}
