import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';
import 'package:high_five/AuthModule/Services/google_signin_service.dart';
import 'package:high_five/AuthModule/ViewModel/auth_vm.dart';
// import 'package:high_five/InboxModule/Model/inbox_model.dart';
import 'package:high_five/InboxModule/Services/inbox_service.dart';

class InboxVm extends GetxController {
  final InboxServices inboxServices = InboxServices();
  // Rx<InboxModel> inboxModel = InboxModel(image: '', name: '').obs;
  final AuthVM authVM = AuthVM();

  UserModel userModel = AuthVM.userModel;
  final TextEditingController emailCtrl = TextEditingController();

  signOutGoogle() async {
    GoogleSignInServices.signOut();
  }

  addNewChatOnTap(String email) async {
    emailCtrl.clear();
    Get.back();
    await inboxServices.newChatService(
        email: email, usermodel: AuthVM.userModel);
  }
}
