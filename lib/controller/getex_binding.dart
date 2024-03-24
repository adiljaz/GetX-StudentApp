import 'package:get/get.dart';
import 'package:h1/controller/add_controller.dart';
import 'package:h1/controller/edit_controller.dart';
import 'package:h1/controller/studentdata.dart';

class Intailization implements Bindings {
  @override
  void dependencies() {
    Get.put<Addcontroller>(Addcontroller());
    Get.put<EditingController>(EditingController());
    Get.put<StudenetController>(StudenetController());
  }
}
