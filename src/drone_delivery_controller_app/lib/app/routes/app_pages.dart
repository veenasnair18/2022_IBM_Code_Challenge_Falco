import 'package:get/get.dart';

import '../modules/drone_list/bindings/drone_list_binding.dart';
import '../modules/drone_list/views/drone_list_view.dart';
import '../modules/frontscreen/bindings/frontscreen_binding.dart';
import '../modules/frontscreen/views/frontscreen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/order_assign/bindings/order_assign_binding.dart';
import '../modules/order_assign/views/order_assign_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const FRONT = Routes.FRONTSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FRONTSCREEN,
      page: () => FrontscreenView(),
      binding: FrontscreenBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_ASSIGN,
      page: () => OrderAssignView(),
      binding: OrderAssignBinding(),
    ),
    GetPage(
      name: _Paths.DRONE_LIST,
      page: () => DroneListView(),
      binding: DroneListBinding(),
    ),
  ];
}
