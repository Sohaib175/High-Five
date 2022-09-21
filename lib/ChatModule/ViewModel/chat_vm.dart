import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/ChatModule/Model/chat_model.dart';

class ChatVM extends GetxController {
  var isEmojiVisible = false.obs;
  RxBool isSendVisible = false.obs;
  FocusNode inpuFieldFocusNode = FocusNode();
  Rx<TextEditingController> textEditingController = TextEditingController().obs;
  RxList<MessageModel> messagesData = <MessageModel>[].obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   inpuFieldFocusNode.addListener(() {
  //     if (inpuFieldFocusNode.hasFocus) {
  //       isEmojiVisible.value = false;
  //     }
  //   });
  // }

  onFetchChat({required String chatID}) async {
    List<MessageModel> messages = <MessageModel>[];
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
        await FirebaseFirestore.instance
            .collection("chat")
            .doc(chatID)
            .collection("messages")
            .orderBy("createdOn", descending: true)
            .snapshots();

    snapshot.listen((event) {
      messages.clear();
      for (int index = 0; index < event.docs.length; index++) {
        messages.add(MessageModel.fromJson(event.docs[index]));
      }
      messagesData.value = messages;
      print(messages);
    });
  }

  onSendTextMessage({required String myUID, required String chatID}) async {
    await FirebaseFirestore.instance
        .collection("chat")
        .doc(chatID)
        .collection("messages")
        .doc()
        .set({
      "text": textEditingController.value.value.text,
      "userId": myUID,
      "createdOn": DateTime.now().millisecondsSinceEpoch,
    });
    textEditingController.value.clear();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    textEditingController.value.dispose();
  }
}
