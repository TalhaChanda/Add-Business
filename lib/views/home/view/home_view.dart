import 'package:add_business/utils/app_images.dart';
import 'package:add_business/utils/app_routes.dart';
import 'package:add_business/utils/app_theme.dart';
import 'package:add_business/utils/gaps.dart';
import 'package:add_business/utils/text_styles.dart';
import 'package:add_business/utils/widgets/home_widget.dart';
import 'package:add_business/utils/widgets/image/container_image.dart';
import 'package:add_business/utils/widgets/setting_widget.dart';
import 'package:add_business/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Column(
          children: [
            verticalGap(context.height * .12),
            Container(
              width: context.width * .35,
              height: 100,
              decoration: BoxDecoration(
                image: containerImage(AppImages.profile),
                border: Border.all(color: AppTheme.white, width: 2),
                shape: BoxShape.circle,
              ),
            ),
            verticalGap(context.height * .018),
            Text(
              "David Jerome",
              style: TextStyles.white623,
            ),
            verticalGap(context.height * .018),
            Text(
              "David.J@gmail.com",
              style: TextStyles.white415,
            ),
            verticalGap(context.height * .03),
            SizedBox(
              width: context.width * .88,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeWidget(
                    onTap: () {
                      Get.toNamed(AppRoutes.addBusiness);
                    },
                    icon: Icons.add_business,
                    title: "Add Business",
                  ),
                  HomeWidget(
                    icon: Icons.reviews,
                    title: "Add Review",
                  ),
                  HomeWidget(
                    icon: Icons.photo,
                    title: "Add Photo",
                  ),
                ],
              ),
            ),
            verticalGap(context.height * .03),
            Expanded(
              child: Container(
                width: context.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: AppTheme.white),
                child: Column(
                  children: [
                    verticalGap(context.height * .02),
                    SizedBox(
                      width: context.width * .88,
                      child: Text(
                        "Settings",
                        style: TextStyles.black520,
                      ),
                    ),
                    verticalGap(context.height * .03),
                    SettingWidget(
                      icon: Icons.phone_android_sharp,
                      title: "Phone Number",
                      value: "Add Number",
                    ),
                    verticalGap(context.height * .025),
                    SettingWidget(
                      icon: Icons.language,
                      title: "Language",
                      value: "English (eng)",
                    ),
                    verticalGap(context.height * .025),
                    SettingWidget(
                      icon: Icons.currency_exchange_sharp,
                      title: "Currency",
                      value: "US Dollor (\$)",
                    ),
                    verticalGap(context.height * .025),
                    SettingWidget(
                      icon: Icons.edit,
                      title: "Profile Setting",
                      value: "Edit Profile",
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
