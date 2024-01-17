import 'package:add_business/utils/app_theme.dart';
import 'package:add_business/utils/gaps.dart';
import 'package:add_business/utils/text_styles.dart';
import 'package:add_business/utils/widgets/dropdown_widget.dart';
import 'package:add_business/utils/widgets/main_button_widget.dart';
import 'package:add_business/utils/widgets/text_field_widget.dart';
import 'package:add_business/views/add_business/controller/add_business_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBusinessView extends StatelessWidget {
  const AddBusinessView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddBusinessController>();

    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text(
          "Add Business",
          style: TextStyles.white620,
        ),
      ),
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: SingleChildScrollView(
          child: Form(
            key: controller.globalKey,
            child: Column(
              children: [
                verticalGap(context.height * .025),
                TextFieldWidget(
                  title: "Your email",
                  hintText: "you@yourdomain.com",
                  validator: (value) =>
                      controller.validateYourEmail(value.toString()),
                ),
                verticalGap(context.height * .025),
                TextFieldWidget(
                  title: "Listing Name",
                  hintText: "Your listing Name",
                  validator: (value) =>
                      controller.validateListingName(value.toString()),
                ),
                verticalGap(context.height * .025),
                TextFieldWidget(
                  title: "Description",
                  validator: (value) =>
                      controller.validateDescription(value.toString()),
                  maxLines: 5,
                ),
                verticalGap(context.height * .025),
                Obx(() => DropDownWidget(
                      title: "Listing category",
                      value: controller.salectedlistingCategory.value,
                      items: [
                        ...(controller.listingCategory).map((item) {
                          return DropdownMenuItem(
                            value: item['id'],
                            child: Text(item['title'].toString()),
                          );
                        }),
                      ],
                      onChanged: (value) {
                        controller.salectedlistingCategory.value = value;
                      },
                    )),
                verticalGap(context.height * .025),
                Obx(() => DropDownWidget(
                      title: "Listing Region ",
                      title2: "(optional)",
                      value: controller.salectedlistingRegion.value,
                      items: [
                        ...(controller.listingRegion).map((item) {
                          return DropdownMenuItem(
                            value: item['id'],
                            child: Text(item['title'].toString()),
                          );
                        }),
                      ],
                      onChanged: (value) {
                        controller.salectedlistingRegion.value = value;
                      },
                    )),
                verticalGap(context.height * .025),
                Obx(() => DropDownWidget(
                      title: "Listing Amenities ",
                      title2: "(optional)",
                      value: controller.salectedlistingAmenities.value,
                      items: [
                        ...(controller.listingAmenities).map((item) {
                          return DropdownMenuItem(
                            value: item['id'],
                            child: Text(item['title'].toString()),
                          );
                        }),
                      ],
                      onChanged: (value) {
                        controller.salectedlistingAmenities.value = value;
                      },
                    )),
                verticalGap(context.height * .025),
                SizedBox(
                    width: context.width * .88,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Featured Image",
                        style: TextStyles.black416,
                      ),
                      TextSpan(
                        text: " (optional)",
                        style: TextStyles.grey416,
                      )
                    ]))),
                verticalGap(context.height * .025),
                SizedBox(
                  width: context.width * .88,
                  child: Row(
                    children: [
                      Container(
                        width: context.width * .41,
                        height: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppTheme.primaryColor)),
                        child: Obx(() {
                          if (controller.imageFile.value != null) {
                            return Image.file(
                              controller.imageFile.value!,
                              fit: BoxFit.fill,
                            );
                          }
                          return const Icon(
                            Icons.image,
                            size: 50,
                            color: AppTheme.grey,
                          );
                        }),
                      ),
                      horizontalGap(context.width * .02),
                      GestureDetector(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: Container(
                          width: context.width * .3,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppTheme.primaryColor),
                          child: Center(
                            child: Text(
                              "Choose Image",
                              style: TextStyles.white515,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                verticalGap(context.height * .02),
                SizedBox(
                    width: context.width * .88,
                    child: Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "Remote Position",
                            style: TextStyles.black416,
                          ),
                          TextSpan(
                            text: " (optional)",
                            style: TextStyles.grey416,
                          )
                        ])),
                        Obx(() => Checkbox(
                            activeColor: AppTheme.primaryColor,
                            value: controller.checkValue.value,
                            onChanged: (value) {
                              controller.checkValue.value = value!;
                            })),
                      ],
                    )),
                verticalGap(context.height * .01),
                const TextFieldWidget(
                  title: "Website ",
                  title2: "(optional)",
                  hintText: "e.g yourwebsite.com, London",
                ),
                verticalGap(context.height * .025),
                Obx(() => DropDownWidget(
                      title: "Price Range ",
                      title2: "(optional)",
                      value: controller.salectedlistingPrice.value,
                      items: [
                        ...(controller.listingPrice).map((item) {
                          return DropdownMenuItem(
                            value: item['id'],
                            child: Text(item['title'].toString()),
                          );
                        }),
                      ],
                      onChanged: (value) {
                        controller.salectedlistingPrice.value = value;
                      },
                    )),
                verticalGap(context.height * .025),
                const TextFieldWidget(
                  title: "Price From ",
                  title2: "(optional)",
                  hintText: "e.g \$100",
                ),
                verticalGap(context.height * .025),
                const TextFieldWidget(
                  title: "Price To ",
                  title2: "(optional)",
                  hintText: "e.g \$200",
                ),
                verticalGap(context.height * .025),
                const TextFieldWidget(
                  title: "Phone ",
                  title2: "(optional)",
                  hintText: "e.g +84-669-996",
                ),
                verticalGap(context.height * .025),
                const TextFieldWidget(
                  title: "Facebook url ",
                  title2: "(optional)",
                  hintText: "http://facebook.com/yourusername",
                ),
                verticalGap(context.height * .025),
                const TextFieldWidget(
                  title: "Linkedin url ",
                  title2: "(optional)",
                  hintText: "http://linkedin.com/yourusername",
                ),
                verticalGap(context.height * .035),
                MainButtonWidget(
                  onPressFunction: () {
                    controller.submit();
                  },
                  stringText: "Submit",
                ),
                verticalGap(context.height * .025),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
