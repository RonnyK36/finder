import 'package:finder/controllers/auth_controllers.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}
