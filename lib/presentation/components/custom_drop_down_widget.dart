import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modern_pawwz/core/theme/app_colors.dart';
import 'package:modern_pawwz/main.dart';
import 'package:sizable/sizable.dart';

final customBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(12),
  color: Colors.white.withOpacity(.91),
  boxShadow: [
    BoxShadow(
      color: Theme.of(navigator.currentState!.context).brightness == Brightness.dark
          ? AppColors.darkBackground
          : AppColors.lightBackground,
      offset: const Offset(0, 3),
      blurRadius: 5,
      spreadRadius: 3,
    ),
  ],
);

class CustomDropDownButton extends StatefulWidget {
  final String? hint;
  final TextEditingController hook;
  final List<String> list;
  final String? initialValue;
  final double? width;
  final bool isShadow;
  final bool isMargin;
  final Widget? icon;
  final VoidCallback? function;

  const CustomDropDownButton({
    Key? key,
    required this.hook,
    required this.list,
    this.hint,
    this.initialValue,
    this.width,
    this.isShadow = true,
    this.isMargin = true,
    this.icon,
    this.function,
  }) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  late String selectedVal;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    selectedVal = widget.initialValue ?? '';
  }

  void toggleDropdown() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void selectValue(String val) {
    setState(() {
      selectedVal = val;
      widget.hook.text = val;
      _isExpanded = false;
    });
    widget.function?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: spacing(),
      margin: widget.isMargin ? spacingSym(v: 5, h: 10) : null,
      decoration: customBoxDecoration.copyWith(
        color: theme.cardColor,
        boxShadow: widget.isShadow ? null : [],
      ),
      width: widget.width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The clickable selected value area
          InkWell(
            onTap: toggleDropdown,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400),
                color: theme.cardColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.icon ??
                      Text(
                        selectedVal.isEmpty ? (widget.hint ?? '') : selectedVal,
                        style: theme.textTheme.bodySmall,
                      ),
                  Icon(_isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                ],
              ),
            ),
          ),

          // Inline dropdown list
          if (_isExpanded)
            Container(
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: theme.cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                children: widget.list.map((value) {
                  final bool isSelected = value == selectedVal;
                  return InkWell(
                    onTap: () => selectValue(value),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? theme.colorScheme.primary.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        value,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isSelected ? theme.colorScheme.primary : null,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------

class CustomDropDownWithRefresh<T> extends StatefulWidget {
  final bool isEmpty;
  final bool isLoading;
  final bool isMargin;
  final bool isShadow;
  final List<T> list;
  final List<DropdownMenuItem<T>> menuList;
  final T? selectedValue;
  final String hint;
  final String? value;
  final double? width;
  final VoidCallback refreshFunction;
  final void Function(T val) onChangedFunction;

  final bool? selectListisEmpty;
  final String Function(int index)? strfunction;
  final int? length;
  final void Function(int index)? removefunction;

  const CustomDropDownWithRefresh({
    Key? key,
    required this.hint,
    required this.isEmpty,
    this.isLoading = false,
    this.width,
    this.isMargin = true,
    required this.list,
    required this.menuList,
    required this.onChangedFunction,
    required this.refreshFunction,
    this.value,
    this.selectedValue,
    this.isShadow = true,
    this.selectListisEmpty,
    this.removefunction,
    this.length,
    this.strfunction,
  }) : super(key: key);

  @override
  State<CustomDropDownWithRefresh<T>> createState() => _CustomDropDownWithRefreshState<T>();
}

class _CustomDropDownWithRefreshState<T> extends State<CustomDropDownWithRefresh<T>> {
  bool _isExpanded = false;

  void toggleDropdown() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void selectValue(T val) {
    widget.onChangedFunction(val);
    setState(() {
      _isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: widget.width,
        padding: widget.isMargin ? spacingSym(v: 5, h: 10) : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (widget.isEmpty)
                  InkWell(
                    onTap: widget.refreshFunction,
                    child: widget.isLoading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                        : const Icon(Icons.refresh),
                  ),
                if (widget.isEmpty) 5.sizew,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: toggleDropdown,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: spacing(),
                          margin: spacingOnly(b: 5),
                          height: 50,
                          decoration: customBoxDecoration.copyWith(
                            color: theme.cardColor,
                            boxShadow: widget.isShadow ? null : [],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  (widget.value?.isEmpty ?? true) ? widget.hint : widget.value!,
                                  style: theme.textTheme.bodySmall,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(_isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),

                      if (_isExpanded)
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: theme.cardColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            children: widget.menuList.map((item) {
                              final bool isSelected = item.value == widget.selectedValue;
                              return InkWell(
                                onTap: () {
                                  if (item.value != null) {
                                    selectValue(item.value!);
                                  }
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? theme.colorScheme.primary.withOpacity(0.2)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: DefaultTextStyle(
                                    style: theme.textTheme.bodySmall!.copyWith(
                                      color: isSelected ? theme.colorScheme.primary : null,
                                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                    ),
                                    child: item.child,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (widget.selectListisEmpty == true)
              Container(
                constraints: const BoxConstraints(minHeight: 50, maxHeight: 150),
                margin: spacing(value: 5),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Wrap(
                      children: List.generate(widget.length ?? 0, (index) {
                        final text = widget.strfunction?.call(index) ?? '';
                        return Container(
                          margin: spacingSym(v: 5, h: 3),
                          padding: spacing(),
                          decoration: BoxDecoration(
                            color: theme.cardColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(text, style: theme.textTheme.bodySmall),
                              10.sizew,
                              InkWell(
                                onTap: () => widget.removefunction?.call(index),
                                child: Icon(Icons.clear, size: 20, color: Colors.red.shade400),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
