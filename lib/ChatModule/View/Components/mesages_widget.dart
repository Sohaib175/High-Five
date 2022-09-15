import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/ChatModule/Model/chat_model.dart';
import 'package:high_five/utill/Constants/const_color.dart';

// import 'custom_messages.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({Key? key, required this.message, required this.barimage})
      : super(key: key);

  final ChateModel message;
  final String barimage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            const CircleAvatar(
              radius: 25,
              child: Icon(
                Icons.person,
                size: 16,
              ),
              //, backgroundImage: AssetImage(barimage),
            ),
          ],
          _messageContaint(message),
        ],
      ),
    );
  }

  Widget _messageContaint(ChateModel message) {
    switch (message.messageType) {
      case MessageType.text:
        return _buildTextMessage(message);
      case MessageType.image:
        // return  _buildTextMessage(message);
        return const SizedBox();

      default:
        return const SizedBox();
    }
  }

  Container _buildTextMessage(ChateModel message) {
    return Container(
      constraints: BoxConstraints(maxWidth: Get.width - 150),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ConstColors.primaryColor,
          borderRadius: message.isSender
              ? const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
      child: Text(
        message.message,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 12,
          color: ConstColors.onPrimaryColor,
        ),
        softWrap: true,
      ),
    );
  }
}
