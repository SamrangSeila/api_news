import 'package:api_news/Controllers/controller.dart';
import 'package:get/get.dart';


class ControllerBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
    // TODO: implement dependencies
  }

}