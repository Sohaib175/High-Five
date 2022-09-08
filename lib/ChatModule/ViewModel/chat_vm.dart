import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatVM extends GetxController {
  var isEmojiVisible = false.obs;
  RxBool isSendVisible = false.obs;
  FocusNode inpuFieldFocusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    inpuFieldFocusNode.addListener(() {
      if (inpuFieldFocusNode.hasFocus) {
        isEmojiVisible.value = false;
      }
    });
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    textEditingController.dispose();
  }
}
