import 'package:add_business/utils/app_theme.dart';
import 'package:add_business/utils/gaps.dart';
import 'package:add_business/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    this.hintText,
    this.controller,
    this.obscureText,
    this.keyboardType,
    this.icon,
    this.title,
    this.maxLines,
    this.validator,
    this.title2,
    super.key,
  });

  final String? hintText, icon, title, title2;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final int? maxLines;
  final String? Function(String?)? validator;

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
        SizedBox(
          width: context.width * .88,
          // height: 45,
          child: TextFormField(
            maxLines: maxLines,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType ?? TextInputType.text,
            controller: controller,
            validator: validator,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              hintStyle: TextStyles.grey416,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppTheme.primaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppTheme.primaryColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppTheme.primaryColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
