import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/IndividualChatModule/Model/inbox_model.dart';
import 'package:high_five/IndividualChatModule/View/Components/mesages_widget.dart';
import 'package:high_five/IndividualChatModule/ViewModel/ind_chat_vm.dart';
import 'package:high_five/Responsive/responsive.dart';
import 'package:high_five/utill/Constants/const_color.dart';

class IndividualChatView extends StatelessWidget {
  IndividualChatView({
    Key? key,
    required this.imageURL,
    required this.name,
    // required this.onlineStatus,
  }) : super(key: key);
  final IndChatVM indChatVM = Get.put(IndChatVM());
  final String imageURL;
  final String name;
  // final String? onlineStatus;
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ConstColors.primaryColor,
        appBar: _buildAppBar(),
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: Container(
          height: Get.height - Get.bottomBarHeight,
          color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  // physics:ScrollPhysics() ,
                  itemCount: ChateModel.chatDoc.length,
                  reverse: true,
                  itemBuilder: (BuildContext context, int index) {
                    return MessageWidget(
                        message: ChateModel.chatDoc[index], barimage: imageURL);
                  },
                ),
              ),
              // _buildTextField()
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: Size(Get.width, 40.h),
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: ConstColors.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: SizedBox(
                width: 50.w,
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back),
                    const ResponsiveSizedBox.horizontal(8),
                    CircleAvatar(
                      radius: 14.r,
                      backgroundImage: NetworkImage(imageURL),
                    ),
                  ],
                ),
              ),
            ),
            const ResponsiveSizedBox.horizontal(8),
            Text(
              name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            _buildPopMenuAppBar()
          ],
        ),
      ),
    );
  }

  PopupMenuButton<String> _buildPopMenuAppBar() {
    return PopupMenuButton<String>(
      color: ConstColors.primaryColor,
      iconSize: 16.sp,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      position: PopupMenuPosition.under,
      // offset: const Offset(30, 100),
      onSelected: (value) {
        print(value);
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: "View Contact",
            child: Text(
              "View Contact",
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          PopupMenuItem(
            value: "Media, links, and docs",
            child: Text(
              "Media, links, and docs",
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          PopupMenuItem(
            value: "Whatsapp Web",
            child: Text(
              "Whatsapp Web",
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          PopupMenuItem(
            value: "Search",
            child: Text(
              "Search",
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          PopupMenuItem(
            value: "Mute Notification",
            child: Text(
              "Mute Notification",
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          PopupMenuItem(
            value: "Wallpaper",
            child: Text(
              "Wallpaper",
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ];
      },
    );
  }

  PopupMenuButton<String> _buildPopMenuAttachement() {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.attach_file,
        color: ConstColors.onPrimaryColor,
      ),
      iconSize: 16.sp,
      color: ConstColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      offset: const Offset(-30, -300),
      position: PopupMenuPosition.over,
      onSelected: (value) {
        print(value);
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: "document",
            child: Row(
              children: [
                Icon(
                  Icons.file_copy_outlined,
                  size: 16.sp,
                  color: ConstColors.onPrimaryColor,
                ),
                const ResponsiveSizedBox.horizontal(10),
                Text(
                  "Document",
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: "camera",
            child: Row(
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  size: 16.sp,
                  color: ConstColors.onPrimaryColor,
                ),
                const ResponsiveSizedBox.horizontal(10),
                Text(
                  "Camera",
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: "gallery",
            child: Row(
              children: [
                Icon(
                  Icons.photo,
                  size: 16.sp,
                  color: ConstColors.onPrimaryColor,
                ),
                const ResponsiveSizedBox.horizontal(10),
                Text(
                  "Gallery",
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: "audio",
            child: Row(
              children: [
                Icon(
                  Icons.headphones,
                  size: 16.sp,
                  color: ConstColors.onPrimaryColor,
                ),
                const ResponsiveSizedBox.horizontal(10),
                Text(
                  "Audio",
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: "contact",
            child: Row(
              children: [
                Icon(
                  Icons.contact_phone,
                  size: 16.sp,
                  color: ConstColors.onPrimaryColor,
                ),
                const ResponsiveSizedBox.horizontal(10),
                Text(
                  "Contact",
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: "location",
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 16.sp,
                  color: ConstColors.onPrimaryColor,
                ),
                const ResponsiveSizedBox.horizontal(10),
                Text(
                  "Location",
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ];
      },
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: ConstColors.primaryColor,
            ),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width - 44.sp,
                  child: TextFormField(
                    maxLines: 5,
                    minLines: 1,
                    // focusNode: indChatVM.inpuFieldFocusNode,
                    controller: indChatVM.textEditingController,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: ConstColors.onPrimaryColor,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      hintText: 'Message',
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: IconButton(
                        iconSize: 18.sp,
                        color: ConstColors.onPrimaryColor,
                        onPressed: () {
                          // indChatVM.isEmojiVisible.value =
                          //     !indChatVM.isEmojiVisible.value;
                          // indChatVM.inpuFieldFocusNode.unfocus();
                          // indChatVM.inpuFieldFocusNode.canRequestFocus =
                          //     true;
                          // _buildPickEmoji();
                        },
                        icon: const Icon(Icons.emoji_emotions),
                      ),
                      suffixIcon: Obx(
                        () => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildPopMenuAttachement(),
                            indChatVM.isSendVisible.value
                                ? const SizedBox.shrink()
                                : IconButton(
                                    onPressed: () {},
                                    iconSize: 16.sp,
                                    splashColor: Colors.black,
                                    splashRadius: 8,
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                      color: ConstColors.onPrimaryColor,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        indChatVM.isSendVisible.value = true;
                      } else {
                        indChatVM.isSendVisible.value = false;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 16.sp,
            backgroundColor: ConstColors.primaryColor,
            child: Obx(
              () => IconButton(
                onPressed: indChatVM.isSendVisible.value
                    ? () {
                        print('send');
                      }
                    : () {
                        print('voice');
                      },
                iconSize: 16.sp,
                splashColor: ConstColors.onPrimaryColor.withOpacity(0.5),
                splashRadius: 22,
                icon: indChatVM.isSendVisible.value
                    ? Icon(
                        Icons.send,
                        color: ConstColors.onPrimaryColor,
                      )
                    : Icon(
                        Icons.mic,
                        color: ConstColors.onPrimaryColor,
                      ),
              ),
            ),
          ),
          // ),
        ],
      ),
    );
  }

  _buildPickEmoji() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        print(emoji);
      },
    );
  }
}
