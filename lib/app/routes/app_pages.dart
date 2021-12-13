import 'package:get/get.dart';

import 'package:latihan_awesome_notifications/app/modules/bidding/bindings/bidding_binding.dart';
import 'package:latihan_awesome_notifications/app/modules/bidding/views/bidding_view.dart';
import 'package:latihan_awesome_notifications/app/modules/home/bindings/home_binding.dart';
import 'package:latihan_awesome_notifications/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BIDDING,
      page: () => BiddingView(),
      binding: BiddingBinding(),
    ),
  ];
}
