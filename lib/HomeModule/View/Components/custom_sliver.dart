import 'package:flutter/material.dart';
import 'package:high_five/utill/Constants/const_color.dart';

class CustomSliverBar extends StatefulWidget {
  const CustomSliverBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomSliverBar> createState() => _CustomSliverBarState();
}

class _CustomSliverBarState extends State<CustomSliverBar> {
  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
      //TODO: AppBar leading in Builder
      // leading: top > 120
      //     ? const Padding(
      //         padding: EdgeInsets.all(8.0),
      //         child: CircleAvatar(
      //           backgroundImage: NetworkImage(
      //             'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
      //             // fit: BoxFit.cover,
      //           ),
      //         ),
      //       )
      //     : const Text('data'),
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      backgroundColor: ConstColors.primaryColor,
      foregroundColor: ConstColors.onPrimaryColor,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          top = constraints.biggest.height;

          //this Shows small profile avatar
          return FlexibleSpaceBar(
            title: top <= 120
                ? const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'),
                      ),
                    ),
                  )
                : null,
            background: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
              ),
            ),
          );
        },
      ),
    );
  }
}
