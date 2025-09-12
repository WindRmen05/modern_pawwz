import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/core/theme/app_colors.dart';
import 'package:sizable/sizable.dart';

Widget CustomTextField({
  Key? key,
  double? width,
  TextEditingController? controller,
  String label = "Label",
  String? initialValue,
  String hint = "Enter here",
  int maxLength = 300,
  int maxLines = 1,
  int minLines = 1,
  FloatingLabelBehavior? floatingLabelBehavior,
  bool showLabel = true,
  bool enabled = true,
  Widget? prefixIcon,
  Widget? suffixIcon,
  EdgeInsets? padding,
  double? height,
  double? radius,
  Function(String)? onChanged,
  Function()? onTap,
  TextInputType? keyboardType,
  bool obscureText = false,
  bool isTopPadding = true,
  String? Function(String?)? validator,
}) {
  return Builder(builder: (context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textColor = theme.textTheme.bodyMedium?.color ?? Colors.black;
    final labelColor = theme.brightness == Brightness.light
        ? Colors.grey.shade800
        : Colors.grey.shade300;
    final hintColor = theme.brightness == Brightness.light
        ? Colors.grey.shade600
        : Colors.grey.shade500;

    return Container(
      width: width,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isTopPadding) 20.sp.sizeh,
          TextFormField(
            key: key,
            initialValue: initialValue,
            controller: controller,
            autofocus: false,
            enabled: enabled,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLength: maxLength,
            maxLines: maxLines,
            minLines: minLines,
            autocorrect: true,
            validator: validator,
            onTap: onTap,
            onChanged: onChanged,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor),
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              counterText: '',
              contentPadding: padding ?? spacing(value: 20),
              label: showLabel
                  ? Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: labelColor,
                  fontWeight: FontWeight.w500,
                ),
              )
                  : null,
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: hintColor,
                fontWeight: FontWeight.w400,
              ),
              floatingLabelBehavior:
              floatingLabelBehavior ?? FloatingLabelBehavior.always,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              alignLabelWithHint: true,

              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: theme.brightness == Brightness.light
                      ? Colors.grey.shade500
                      : Colors.grey.shade700,
                ),
                borderRadius:
                BorderRadius.all(Radius.circular(radius ?? 20)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: theme.brightness == Brightness.light
                      ? Colors.grey.shade300
                      : Colors.grey.shade600,
                ),
                borderRadius:
                BorderRadius.all(Radius.circular(radius ?? 20)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2.sp,
                  color: AppColors.lightPrimary,
                ),
                borderRadius:
                BorderRadius.all(Radius.circular(radius ?? 20)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red.shade400,
                ),
                borderRadius:
                BorderRadius.all(Radius.circular(radius ?? 20)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2.sp,
                  color: Colors.red.shade400,
                ),
                borderRadius:
                BorderRadius.all(Radius.circular(radius ?? 20)),
              ),
            ),
          ),
        ],
      ),
    );
  });
}
