import 'package:add_business/utils/app_theme.dart';
import 'package:add_business/utils/gaps.dart';
import 'package:add_business/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key, this.icon, this.title, this.onTap});
  IconData? icon;
  String? title;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: context.width * .26,
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(icon),
              ),
            ),
            verticalGap(context.height * .012),
            Text(
              "$title",
              style: TextStyles.white515,
            ),
          ],
        ),
      ),
    );
  }
}
