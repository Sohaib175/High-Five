import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';
import 'package:high_five/AuthModule/Services/google_signin_service.dart';
import 'package:high_five/AuthModule/ViewModel/auth_vm.dart';
import 'package:high_five/InboxModule/Model/inbox_model.dart';

// import 'package:high_five/InboxModule/Model/inbox_model.dart';
import 'package:high_five/InboxModule/Services/inbox_service.dart';
import 'package:high_five/utill/get_storage_handler.dart';

class InboxVM extends GetxController {
  final InboxServices inboxServices = InboxServices();
  final GetStorageHandler getStorageHandler = GetStorageHandler();

  Rx<UserModel> userModel =
      UserModel(userId: "", name: "", email: "", profileImage: "").obs;

  final TextEditingController emailCtrl = TextEditingController();
  RxList<InboxModel> inboxList = <InboxModel>[].obs;



  fetchMyInbox() async {
    inboxList.value =
        await inboxServices.fetchInboxService(myUserID: userModel.value.userId);
  }

  signOutGoogle() async {
    await GoogleSignInServices().signOut();
    getStorageHandler.deleteUserId();
  }

  addNewChatOnTap() async {
    await inboxServices.newChatService(
        email: emailCtrl.value.text, usermodel: userModel.value);
    emailCtrl.clear();
    await fetchMyInbox();
    Get.back();
  }
}
