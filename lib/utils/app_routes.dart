import 'package:add_business/views/add_business/view/add_business_view.dart';
import 'package:add_business/views/home/view/home_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String home = "/";
  static String addBusiness = "/addBusiness";


  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomeView()),
    GetPage(name: addBusiness, page: () => const AddBusinessView()),

  ];
}
