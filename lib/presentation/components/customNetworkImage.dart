import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/components/CustomLoadingWidget.dart';
import 'package:sizable/sizable.dart';

customNetworkImage(
    String src, {
      String? tag,
      double? size,
      double? height,
      double? borderWidth,
      Color? borderColor,
      double? width,
      double? radius,
    }) =>
    Align(
      alignment: Alignment.center,
      child: Container(
        padding: spacing(value: 2),
        decoration: BoxDecoration(
          // color: shadowGrey,
          // border: Border.all(
          //   width: borderWidth ?? 1,
          //   color: borderColor ?? Colors.grey,
          // ),
          borderRadius: BorderRadius.circular(radius ?? 100),
        ),
        height: size ?? height,
        width: size ?? width,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 100),
            color: Colors.grey.shade400,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 100),
            clipBehavior: Clip.hardEdge,

            child: Image.network(
              src,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return CustomLoadingWidget(ht: 100);
              },

              errorBuilder: (context, error, stackTrace) {
                return Padding(
                  padding: spacing(),
                  child: Image.asset(
                    "assets/icons/image.png",
                  ),
                );
              },
              height: size,
              width: size,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
