import 'package:add_business/utils/app_theme.dart';
import 'package:add_business/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class MainButtonWidget extends StatelessWidget {
  Function()? onPressFunction;
  String? stringText;

  MainButtonWidget({
    super.key,
    this.onPressFunction,
    this.stringText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .88,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressFunction,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(stringText.toString(), style: TextStyles.white617),
      ),
    );
  }
}
