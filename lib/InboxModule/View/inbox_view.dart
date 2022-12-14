import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/AuthModule/View/login_view.dart';
import 'package:high_five/InboxModule/View/Components/add_new_chat.dart';
import 'package:high_five/InboxModule/View/Components/inbox_tiles_widget.dart';
import 'package:high_five/InboxModule/ViewModel/inbox_vm.dart';
import 'package:high_five/utill/Constants/const_color.dart';

class InboxView extends StatefulWidget {
  InboxView({Key? key}) : super(key: key);

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  final InboxVM inboxVM = Get.put(InboxVM());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inboxVM.fetchMyInbox();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        drawer: _buildDrawer(),
        appBar: _buildAppBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ConstColors.primaryColor,
          foregroundColor: ConstColors.onPrimaryColor,
          onPressed: () {
            Get.to(AddNewChatView());
          },
          child: Icon(
            Icons.add,
            size: 30,
            color: ConstColors.onPrimaryColor,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: InboxTilesWidget(),
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
                  radius: 30,
                  backgroundImage: NetworkImage(
                    inboxVM.userModel.value.profileImage.isNotEmpty
                        ? inboxVM.userModel.value.profileImage
                        : 'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
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
                  inboxVM.userModel.value.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ConstColors.onPrimaryColor,
                  ),
                ),
                Text(
                  inboxVM.userModel.value.email,
                  style: TextStyle(
                    fontSize: 16,
                    color: ConstColors.onPrimaryColor,
                  ),
                ),
              ],
            ),
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
                      inboxVM.userModel.value.profileImage.isNotEmpty
                          ? inboxVM.userModel.value.profileImage
                          : 'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    inboxVM.userModel.value.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    inboxVM.userModel.value.email,
                    style: const TextStyle(fontSize: 16),
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
                    height: 40,
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
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ConstColors.onPrimaryColor,
                        ),
                      ),
                      onPressed: () async {
                        await inboxVM.signOutGoogle();
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
