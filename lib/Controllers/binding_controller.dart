import 'package:get/get.dart';
import 'package:pix_resume/Controllers/details_controller.dart';

class BindingController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DetailsController>(() => DetailsController(),fenix: true);
  }

}