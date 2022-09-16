import 'package:get/get.dart';
import 'package:high_five/AuthModule/Services/firestore_service.dart';
import 'package:high_five/AuthModule/View/login_view.dart';
import 'package:high_five/AuthModule/ViewModel/auth_vm.dart';
import 'package:high_five/InboxModule/View/inbox_view.dart';
import 'package:high_five/InboxModule/ViewModel/inbox_vm.dart';
import 'package:high_five/utill/get_storage_handler.dart';

class SplashVM extends GetxController {
  final getStorageHandler = GetStorageHandler();
  final FirestoreServices firestoreServices = FirestoreServices();
  final InboxVM inboxVM = Get.put(InboxVM());

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loadLocalData();
  }

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   loadLocalData();
  // }

  loadLocalData() async {
    final String localuserId = getStorageHandler.getUserId();

    if (localuserId.isNotEmpty) {
      Future.delayed(const Duration(seconds: 2), () async {
        var userD = await firestoreServices.getFirebaseData(localuserId);
        if (userD != null) {
          inboxVM.userModel.value = userD;
        }
        // authVM.getData();
        Get.offAll(() => InboxView());
      });
    } else {
      Get.offAll(() => LoginView());
    }
  }
}
