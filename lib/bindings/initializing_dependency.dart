import 'package:add_business/views/add_business/controller/add_business_controller.dart';
import 'package:add_business/views/home/controller/home_controller.dart';
import 'package:get/get.dart';

class InitializingDependency implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => AddBusinessController(), fenix: true);

  }
}
