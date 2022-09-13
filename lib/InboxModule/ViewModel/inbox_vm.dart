import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';
import 'package:high_five/AuthModule/Services/google_signin_service.dart';
import 'package:high_five/AuthModule/ViewModel/auth_vm.dart';
import 'package:high_five/InboxModule/Model/inbox_model.dart';
import 'package:high_five/InboxModule/Services/inbox_service.dart';

class InboxVm extends GetxController {
  final InboxServices inboxServices = InboxServices();
  Rx<InboxModel> inboxModel = InboxModel(image: '', name: '').obs;
  UserModel currentUserModel = AuthVM.currentUserModel;
  final TextEditingController emailCtrl = TextEditingController();
  // inboxServices.

  signOutGoogle() async {
    GoogleSignInServices.signOut();
  }

  addNewOnTap(String email) async {
    emailCtrl.clear();
    Get.back();
    await inboxServices.newChatService(
        email: email, usermodel: currentUserModel);
  }

  // addNewFriend(email) async {
  //   // var newFriend = await inboxServices.getNewFriendData(email);
  //   // print(newFriend.toString());
  //   // if (newFriend.toString() != 'false') {
  //   // );
  // }
}

  // createInbox() async {
  //   await inboxServices.createInboxService(newFriendModel: newFriendModel, usermodel: usermodel);
  // }

