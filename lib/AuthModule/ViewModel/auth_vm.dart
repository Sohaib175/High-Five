import 'package:get/get.dart';

// import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthVM extends GetxController {
  RxBool isCreateNew = false.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;
}
