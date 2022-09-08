import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/ChatModule/View/chat_view.dart';
import 'package:high_five/InboxModule/Model/inbox_model.dart';
import 'package:high_five/Responsive/responsive.dart';
import 'package:high_five/utill/Constants/const_color.dart';

class ChatsListWidget extends StatelessWidget {
  ChatsListWidget({
    Key? key,
    // required this.inboxList,
  }) : super(key: key);

  // final List<InboxModel> inboxList;

  final List<InboxModel> inboxList = <InboxModel>[
    InboxModel(
      image:
          'https://www.shareicon.net/data/512x512/2016/05/26/771198_man_512x512.png',
      name: 'No Name',
      lastText: 'This is last Text',
      unreadText: 2,
      time: DateTime.parse('2022-07-20 20:18:04'),
    ),
    InboxModel(
      image:
          'https://www.shareicon.net/data/512x512/2016/05/26/771198_man_512x512.png',
      name: 'No Name',
      lastText: 'This is last Text',
      unreadText: 0,
      time: DateTime.parse('2022-07-20 20:18:04'),
    ),
    InboxModel(
      image:
          'https://www.shareicon.net/data/512x512/2016/05/26/771198_man_512x512.png',
      name: 'No Name',
      lastText: 'This is last Text',
      unreadText: 1,
      time: DateTime.parse('2022-07-20 20:18:04'),
    ),
    InboxModel(
      image:
          'https://www.shareicon.net/data/512x512/2016/05/26/771198_man_512x512.png',
      name: 'No Name',
      unreadText: 0,
      lastText: 'This is last Text',
      time: DateTime.parse('2022-07-20 20:18:04'),
    ),
    InboxModel(
      image:
          'https://www.shareicon.net/data/512x512/2016/05/26/771198_man_512x512.png',
      name: 'No Name',
      unreadText: 0,
      lastText: 'This is last Text',
      time: DateTime.parse('2022-07-20 20:18:04'),
    ),
    InboxModel(
      image:
          'https://www.shareicon.net/data/512x512/2016/05/26/771198_man_512x512.png',
      name: 'No Name',
      unreadText: 0,
      lastText: 'This is last Text',
      time: DateTime.parse('2022-07-20 20:18:04'),
    ),
    InboxModel(
      image:
          'https://www.shareicon.net/data/512x512/2016/05/26/771198_man_512x512.png',
      name: 'No Name',
      unreadText: 0,
      lastText: 'This is last Text',
      time: DateTime.parse('2022-07-20 20:18:04'),
    ),
    InboxModel(
      image:
          'https://www.shareicon.net/data/512x512/2016/05/26/771198_man_512x512.png',
      name: 'No Name',
      unreadText: 0,
      lastText: 'This is last Text',
      time: DateTime.parse('2022-07-20 20:18:04'),
    ),
    InboxModel(
      image:
          'https://www.shareicon.net/data/512x512/2016/05/26/771198_man_512x512.png',
      name: 'No Name',
      unreadText: 0,
      lastText: 'This is last Text',
      time: DateTime.parse('2022-07-20 20:18:04'),
    ),
    InboxModel(
      image:
          'https://www.shareicon.net/data/512x512/2016/05/26/771198_man_512x512.png',
      name: 'Sohaib',
      lastText: 'This is last Text',
      unreadText: 2,
      time: DateTime.parse('2022-09-05 13:12:04'),
    ),
    InboxModel(
      image:
          'https://www.shareicon.net/data/512x512/2016/05/26/771198_man_512x512.png',
      name: 'No Name',
      lastText: 'This is last Text',
      unreadText: 10,
      time: DateTime.parse('2022-07-20 20:18:04'),
    ),
    InboxModel(
      image:
          'https://www.shareicon.net/data/512x512/2016/05/26/771198_man_512x512.png',
      name: 'No Name',
      lastText: 'This is last Text',
      unreadText: 25,
      time: DateTime.parse('2022-07-20 20:18:04'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: inboxList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Get.to(
            () => IndividualChatView(
              imageURL: inboxList[index].image,
              name: inboxList[index].name,
            ),
            transition: Transition.rightToLeft,
            duration: const Duration(
              milliseconds: 300,
            ),
          );
        },
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(inboxList[index].image),
        ),
        title: Text(
          inboxList[index].name,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: ConstColors.onSecondryColor,
          ),
        ),
        subtitle: Row(
          children: [
            //TODO: Message status
            // Container(
            //   height: 10,
            //   width: 10,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: inboxList[index].messageStatus == MessageStatus.notSent
            //         ? Colors.red
            //         : inboxList[index].messageStatus ==
            //                 MessageStatus.notRecieverd
            //             ? Colors.red[300]
            //             : inboxList[index].messageStatus ==
            //                     MessageStatus.notSceen
            //                 ? Colors.greenAccent
            //                 : Colors.green,
            //   ),
            // ),
            const ResponsiveSizedBox.horizontal(6),
            Text(
              inboxList[index].lastText == null
                  ? inboxList[index].lastText!
                  : '',
              style: TextStyle(
                fontSize: 10.sp,
                color: ConstColors.onSecondryColor,
              ),
            ),
          ],
        ),
        trailing: Text(
          inboxList[index].time == null
              ? '${inboxList[index].time!.hour.toString()}:${inboxList[index].time!.minute.toString()}'
              : '',
          style: TextStyle(
            fontSize: 12.sp,
            color: ConstColors.onSecondryColor,
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
