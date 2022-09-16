import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';
import 'package:high_five/AuthModule/Services/google_signin_service.dart';
import 'package:high_five/AuthModule/ViewModel/auth_vm.dart';
// import 'package:high_five/InboxModule/Model/inbox_model.dart';
import 'package:high_five/InboxModule/Services/inbox_service.dart';
import 'package:high_five/utill/get_storage_handler.dart';

class InboxVM extends GetxController {
  final InboxServices inboxServices = InboxServices();
  // Rx<InboxModel> inboxModel = InboxModel(image: '', name: '').obs;
  final GetStorageHandler getStorageHandler = GetStorageHandler();
  final AuthVM authVM = AuthVM();

  ///TODO: We need to demand userModel when InboxView Get Called.
  ///But we also ned userModel in InboxVM when
  ///we are going to add new Friend/Chat
  ///

  UserModel userModel = AuthVM.userModel;
  final TextEditingController emailCtrl = TextEditingController();

  signOutGoogle() async {
    await GoogleSignInServices().signOut();
    getStorageHandler.deleteLocaleId();
  }

  addNewChatOnTap(String email) async {
    emailCtrl.clear();
    Get.back();
    await inboxServices.newChatService(
        email: email, usermodel: AuthVM.userModel);
  }
}
