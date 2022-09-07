import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/IndividualChatModule/Model/inbox_model.dart';
import 'package:high_five/Responsive/responsive.dart';
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
              radius: 18,
              // backgroundImage: AssetImage(barimage),
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
        return Container(
          constraints: BoxConstraints(
            maxWidth: Get.width - 150,
          ),
          // width: Get.width - 250,
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
            style: TextStyle(
              fontSize: 12.sp,
              color: ConstColors.onPrimaryColor,
            ),
            softWrap: true,
          ),
        );

      default:
        return const SizedBox();
    }
  }
}
