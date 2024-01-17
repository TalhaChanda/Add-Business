import 'dart:io';

import 'package:add_business/utils/app_routes.dart';
import 'package:add_business/utils/app_theme.dart';
import 'package:add_business/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddBusinessController extends GetxController {
  var salectedlistingCategory = 1.obs;
  var salectedlistingRegion = 1.obs;
  var salectedlistingAmenities = 1.obs;
  var salectedlistingPrice = 1.obs;
  final globalKey = GlobalKey<FormState>();

  String? validateListingName(String value) {
    if (value.isEmpty) {
      return 'Listing Name is required.';
    }
    return null;
  }

  String? validateDescription(String value) {
    if (value.isEmpty) {
      return 'Description is required.';
    }
    return null;
  }

  String? validateYourEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required.';
    }
    if (!isValidEmail(text: value)) {
      return 'Invalid email address.';
    }
    return null;
  }

  void submit() async {
    if (globalKey.currentState!.validate()) {
      Get.defaultDialog(
        title: 'Add Business',
        middleText: "Form Submit Successfully",
        buttonColor: AppTheme.primaryColor,
        onConfirm: () {
          Get.offAllNamed(AppRoutes.home);
        },
      );
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      final InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
      );
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      );

      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'your_channel_id',
        'your_channel_name',
        importance: Importance.max,
        priority: Priority.high,
      );
      const NotificationDetails platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics, iOS: null);

      await flutterLocalNotificationsPlugin.show(
        0,
        'Add Business',
        'Form Submit Successfully',
        platformChannelSpecifics,
        payload: 'item x',
      );
    }
    update();
  }

  final ImagePicker _imagePicker = ImagePicker();
  Rx<File?> imageFile = Rx<File?>(null);
  var checkValue = false.obs;

  void setImageFile(File file) {
    imageFile.value = file;
  }

  Future<void> pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      setImageFile(image);
    }
  }

  final List<Map<String, dynamic>> listingCategory = [
    {'id': 1, "title": "Arts & Entertainment"},
    {'id': 2, "title": "Automotive"},
    {'id': 3, "title": "Auto electrical"},
    {'id': 4, "title": "Mobile Mechanics"},
    {'id': 5, "title": "Motor mechanics"},
    {'id': 6, "title": "Panel Beater"},
    {'id': 7, "title": "Vehicles"},
    {'id': 8, "title": "Beauty & Spa"},
    {'id': 9, "title": "Barber"},
    {'id': 10, "title": "general"},
    {'id': 11, "title": "hairdresser"},
    {'id': 12, "title": "Massage"},
    {'id': 13, "title": "Nail salon"},
    {'id': 14, "title": "Other"},
    {'id': 15, "title": "general"},
  ];
  final List<Map<String, dynamic>> listingRegion = [
    {'id': 1, "title": "Alkimos"},
    {'id': 2, "title": "Butler"},
    {'id': 3, "title": "Clarkson"},
    {'id': 4, "title": "Eglinton"},
    {'id': 5, "title": "Jindalee"},
  ];

  final List<Map<String, dynamic>> listingAmenities = [
    {'id': 1, "title": "Accept Credit Cards"},
    {'id': 2, "title": "Bike Parking"},
    {'id': 3, "title": "Cable TV"},
    {'id': 4, "title": "Coupons"},
    {'id': 5, "title": "Family/Kids Friendly"},
  ];
  final List<Map<String, dynamic>> listingPrice = [
    {'id': 1, "title": "Prefer not to stay"},
    {'id': 2, "title": "\$ - Inexpensive"},
    {'id': 3, "title": "\$\$ - Moderate"},
    {'id': 4, "title": "\$\$ - Pricey"},
    {'id': 5, "title": "\$\$ - Ultra high"},
  ];
}
