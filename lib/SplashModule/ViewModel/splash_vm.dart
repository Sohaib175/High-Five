import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:high_five/AuthModule/View/login_view.dart';
import 'package:high_five/AuthModule/ViewModel/auth_vm.dart';
import 'package:high_five/InboxModule/View/inbox_view.dart';

class SplashVM extends GetxController {
  final AuthVM authVM = Get.put(AuthVM(), permanent: true);
  final getStorge = GetStorage();

  @override
  void onReady() {
    super.onReady();

    if (getStorge.read("userId") != null) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offAll(() => InboxView());
      });
    } else {
      Get.offAll(() => LoginView());
    }
  }
}

// class SplashBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put<SplashVM>(
//       SplashVM(),
//     );
//     //   if (getStorge.read("id") != null) {
//     //     Future.delayed(const Duration(milliseconds: 3000), () {
//     //       Get.offAll(() => LoginView());
//     //     });
//     //   } else {
//     // Timer(
//     //   const Duration(seconds: 3),
//     //   () => Get.off(
//     //     LoginView(),
//     //   ),
//     // );
//     //   }
//   }
// }
