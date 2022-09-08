import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/AuthModule/View/login_view.dart';
import 'package:high_five/InboxModule/View/Components/chats_list_widget.dart';
import 'package:high_five/InboxModule/ViewModel/inbox_vm.dart';
import 'package:high_five/Responsive/responsive.dart';
import 'package:high_five/utill/Constants/const_color.dart';

class ChatView extends StatelessWidget {
  ChatView({Key? key}) : super(key: key);
  final InboxVm _inboxVM = Get.put(InboxVm());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: _buildDrawer(),
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        // body:
        // NestedScrollView(
        // headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        //   return <Widget>[
        //     const CustomSliverBar(),
        //   ];
        // },
        floatingActionButton: FloatingActionButton(
          backgroundColor: ConstColors.primaryColor,
          foregroundColor: ConstColors.onPrimaryColor,
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => Container(
                height: Get.height * 0.4,
                width: Get.width,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: ConstColors.primaryColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      controller: _inboxVM.emailCtrl,
                      style: TextStyle(
                        color: ConstColors.onPrimaryColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await _inboxVM.createInbox();
                        // createInboxService(
                        //     email: 'chaudharysohaib175@gmail.com');
                      },
                      child: Text(
                        'Add New',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: ConstColors.onPrimaryColor),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          child: Icon(
            Icons.add,
            size: 16.sp,
          ),
        ),

        body: ResponsivePadding(
          padding: REdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: ChatsListWidget(),
        ),
      ),
      // ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: Size(Get.width, 80),
      child: Container(
        color: ConstColors.primaryColor,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20,
                ),
                child: CircleAvatar(
                  radius: 20.sp,
                  backgroundImage: NetworkImage(
                    _inboxVM.userModel.profileImage ??
                        'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  _inboxVM.userModel.name,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: ConstColors.onPrimaryColor,
                  ),
                ),
                Text(
                  _inboxVM.userModel.email,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ConstColors.onPrimaryColor,
                  ),
                ),
              ],
            ),
            // AppBar(
            //   // backgroundColor: ConstColors.primaryColor,

            //   title: SizedBox(
            //     child:
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      backgroundColor: ConstColors.primaryContainerColor,
      width: Get.width * 0.7,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.4,
              width: Get.width * 0.7,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ConstColors.primaryColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: Get.width * 0.25,
                    backgroundImage: NetworkImage(
                      _inboxVM.userModel.profileImage ??
                          'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
                    ),
                  ),
                  const ResponsiveSizedBox.vertical(10),
                  Text(
                    _inboxVM.userModel.name,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  const ResponsiveSizedBox.vertical(10),
                  Text(
                    _inboxVM.userModel.email,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: Get.width * 0.7,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(ConstColors.primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0),
                            // side: const BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      child: Text(
                        'LogOut',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: ConstColors.onPrimaryColor,
                        ),
                      ),
                      onPressed: () async {
                        await _inboxVM.signOutGoogle();
                        Get.offAll(() => LoginView());
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
