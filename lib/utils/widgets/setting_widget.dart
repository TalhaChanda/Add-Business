
import 'package:add_business/utils/app_theme.dart';
import 'package:add_business/utils/gaps.dart';
import 'package:add_business/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingWidget extends StatelessWidget {
  SettingWidget({super.key, this.title, this.value,this.icon});
  String? title, value;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .88,
      child: Row(
        children: [
          Icon(
           icon,
            color: AppTheme.grey,
          ),
          horizontalGap(10),
          SizedBox(
            width: context.width * .3,
            child: Text(
              "$title",
              style: TextStyles.black415,
            ),
          ),
          Spacer(),
          Text(
            "$value",
            style: TextStyles.purple415,
          ),
        ],
      ),
    );
  }
}
