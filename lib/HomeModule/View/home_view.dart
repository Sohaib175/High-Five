import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/HomeModule/View/Components/chats_list_widget.dart';
import 'package:high_five/HomeModule/View/Components/custom_sliver.dart';
import 'package:high_five/HomeModule/ViewModel/home_vm.dart';
import 'package:high_five/Responsive/responsive.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeVM homeVM = Get.put(HomeVM());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                const CustomSliverBar(),
              ];
            },
            body: ResponsivePadding(
              padding: REdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: ChatsListWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
