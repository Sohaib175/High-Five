import 'package:get/get.dart';
import 'package:high_five/AuthModule/Services/firestore_service.dart';
import 'package:high_five/AuthModule/View/login_view.dart';
import 'package:high_five/AuthModule/ViewModel/auth_vm.dart';
import 'package:high_five/InboxModule/View/inbox_view.dart';

class SplashVM extends GetxController {
  final AuthVM authVM = Get.put(AuthVM(), permanent: true);
  final FirestoreServices _firestoreServices = FirestoreServices();

  @override
  void onReady() async {
    super.onReady();
    final String localuserId = await authVM.getStorage.read('userId');

    if (localuserId.isNotEmpty) {
      Future.delayed(const Duration(seconds: 2), () async {
        var userD = await _firestoreServices.getFirebaseData(localuserId);
        if (userD != null) {
          AuthVM.userModel = userD;
        }
        // authVM.getData();
        Get.offAll(() => InboxView());
      });
    } else {
      Get.offAll(() => LoginView());
    }
  }
}
