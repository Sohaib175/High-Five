// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:high_five/AuthModule/ViewModel/auth_vm.dart';
// import 'package:high_five/utill/Constants/const_color.dart';
// import 'package:high_five/Responsive/responsive.dart';

// class CustomSliverBar extends StatefulWidget {
//   const CustomSliverBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<CustomSliverBar> createState() => _CustomSliverBarState();
// }

// class _CustomSliverBarState extends State<CustomSliverBar> {
//   AuthVM authVM = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       bottom: PreferredSize(
//         preferredSize: const Size(50, 50),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CircleAvatar(
//                   radius: 30,
//                   backgroundImage: NetworkImage(
//                     authVM.user != null
//                         ? authVM.user!.photoURL!
//                         : 'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
//                   ),
//                 ),
//                 const ResponsiveSizedBox.horizontal(10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       authVM.user != null ? authVM.user!.displayName! : '',
//                       style: TextStyle(
//                           fontSize: 12.sp, fontWeight: FontWeight.w500),
//                     ),
//                     Text(
//                       authVM.user != null ? authVM.user!.email! : '',
//                       style: TextStyle(fontSize: 12.sp),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//       // actions: [
//       //   IconButton(
//       //     onPressed: () {},
//       //     icon: Icon(
//       //       Icons.more_vert,
//       //       size: 18.sp,
//       //     ),
//       //   ),
//       // ],
//       //TODO: AppBar leading in Builder
//       // leading: top > 120
//       //     ? const Padding(
//       //         padding: EdgeInsets.all(8.0),
//       //         child: CircleAvatar(
//       //           backgroundImage: NetworkImage(
//       //             'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
//       //             // fit: BoxFit.cover,
//       //           ),
//       //         ),
//       //       )
//       //     : const Text('data'),
//       expandedHeight: 300.0,
//       floating: false,
//       pinned: true,
//       backgroundColor: ConstColors.primaryColor,
//       foregroundColor: ConstColors.onPrimaryColor,
//       flexibleSpace: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           return FlexibleSpaceBar(
//             titlePadding: const EdgeInsets.symmetric(
//               horizontal: 30.0,
//               vertical: 8,
//             ),
//             // title: top <= 120
//             //     ? SizedBox(
//             //         height: 50,
//             //         width: 50,
//             //         child: CircleAvatar(
//             //           backgroundImage: NetworkImage(
//             //             authVM.user != null
//             //                 ? authVM.user!.photoURL!
//             //                 : 'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
//             //           ),
//             //         ),
//             //       )
//             //     : null,
//             background: Container(
//               height: 40,
//               width: 40,
//               margin: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                   fit: BoxFit.contain,
//                   image: NetworkImage(
//                     authVM.user != null
//                         ? authVM.user!.photoURL!
//                         : 'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
