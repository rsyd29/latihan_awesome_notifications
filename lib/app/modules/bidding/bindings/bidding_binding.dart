import 'package:get/get.dart';

import '../controllers/bidding_controller.dart';

class BiddingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BiddingController>(
      () => BiddingController(),
    );
  }
}
