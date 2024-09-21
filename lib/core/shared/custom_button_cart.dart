import 'package:flutter/material.dart';

class CustomButtonCart extends StatelessWidget {
  final void Function()? onTap;
  final IconData? icon;
  final Color? color;
  final double? size;
  const CustomButtonCart(
      {Key? key, this.onTap, this.icon, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            // margin: EdgeInsets.only(right: 10.w, top: 10.h),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(3)),
            child: Icon(
              icon,
              size: size,
            )));
  }
}
