import 'package:add_business/utils/app_theme.dart';
import 'package:add_business/utils/gaps.dart';
import 'package:add_business/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownWidget extends StatelessWidget {
  Object? value;
  List<DropdownMenuItem<Object>>? items;
  void Function(dynamic)? onChanged;
  bool? isExpanded;
  String? title, title2;

  DropDownWidget(
      {this.items,
      this.value,
      this.isExpanded,
      this.onChanged,
      this.title,
      this.title2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: context.width * .88,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: title.toString(),
                style: TextStyles.black416,
              ),
              TextSpan(
                text: title2 ?? "",
                style: TextStyles.grey416,
              )
            ]))),
        verticalGap(context.height * .01),
        Container(
          width: context.width * .88,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.primaryColor)),
          child: Center(
            child: DropdownButton(
              padding: EdgeInsets.symmetric(horizontal: 12),
              isExpanded: isExpanded ?? true,
              value: value,
              style: TextStyles.black415,
              underline: SizedBox(),
              iconSize: 24,
              icon: Icon(Icons.keyboard_arrow_down),
              items: items!,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
