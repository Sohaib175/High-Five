// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;

// // import 'package:get/get.dart';

// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0 = Paint()
//       ..shader = ui.Gradient.linear(
//         const Offset(00, 0),
//         const Offset(700, 550),
//         [
//           const Color.fromARGB(255, 46, 11, 65),
//           const Color.fromARGB(255, 71, 23, 213),
//         ],
//         [0.2, 0.7],
//       );

//     // ..shader = ui.Gradient.linear(
//     //   const Offset(0, 0),
//     //   Offset(Get.width, 1),
//     //   // 0.1,
//     //   [
//     //     const Color(0xff2a3a73),
//     //     const Color(0xff000000),
//     //     const Color.fromARGB(255, 255, 111, 111),
//     //     const Color.fromARGB(255, 101, 138, 153),
//     //     const Color.fromARGB(255, 72, 10, 97),
//     //   ],
//     //   [0.1, 0.4, 0.5, 0.7, 0.9],
//     // );

//     // ..shader = ui.Gradient.linear(
//     //   Offset(size.width * 0.64, size.height * 0.00),
//     //   Offset(size.width * 0.64, size.height * 0.00),
//     //   [
//     //     const Color(0xff2906be),
//     //     const Color(0xff000000),
//     //     const Color(0xff000000),
//     //     const Color(0xff000000),
//     //     const Color(0xff000000),
//     //     const Color(0xffffffff),
//     //   ],
//     //   [0, 0, 0, 0, 0, 0],
//     // );
//     // ..color = const Color.fromARGB(255, 74, 99, 119)
//     // ..style = PaintingStyle.fill
//     // ..strokeWidth = 1.0;

//     Path path0 = Path();
//     path0.moveTo(size.width * -0.0037917, size.height * 0.0001892);
//     path0.quadraticBezierTo(size.width * 0.2607917, size.height * 0.0001892,
//         size.width * 0.3128750, size.height * 0.0001892);
//     path0.cubicTo(
//         size.width * 0.3842292,
//         size.height * 0.0452825,
//         size.width * 0.4019375,
//         size.height * 0.0787084,
//         size.width * 0.4107917,
//         size.height * 0.1401993);
//     path0.cubicTo(
//         size.width * 0.4212083,
//         size.height * 0.1906534,
//         size.width * 0.3993333,
//         size.height * 0.2297553,
//         size.width * 0.3170417,
//         size.height * 0.2575050);
//     path0.quadraticBezierTo(size.width * 0.2279792, size.height * 0.3265641, 0,
//         size.height * 0.2701186);
//     path0.lineTo(0, size.height * 0.4719349);
//     path0.quadraticBezierTo(size.width * 0.3061875, size.height * 0.3809157,
//         size.width * 0.4593542, size.height * 0.5518037);
//     path0.cubicTo(
//         size.width * 0.6388542,
//         size.height * 0.6625252,
//         size.width * 0.4638958,
//         size.height * 0.6437563,
//         size.width * 0.5191250,
//         size.height * 0.7506937);
//     path0.quadraticBezierTo(size.width * 0.6073750, size.height * 0.8139884,
//         size.width * 0.4941250, size.height * 0.8793517);
//     path0.lineTo(size.width * 0.3462083, size.height * 1.0027750);
//     path0.lineTo(size.width * 0.0003750, size.height * 1.0015136);
//     path0.lineTo(size.width * -0.0037917, size.height * 0.0001892);
//     path0.close();

//     canvas.drawPath(path0, paint0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }



// // class RPSCustomPainter extends CustomPainter{
  
// //   @override
// //   void paint(Canvas canvas, Size size) {
    
    

// //   Paint paint0 = Paint()
// //       ..color = const Color.fromARGB(255, 33, 150, 243)
// //       ..style = PaintingStyle.fill
// //       ..strokeWidth = 1.0;
// //     paint0.shader = ui.Gradient.radial
// //     (Offset(size.width*0.64,size.height*0.00),
// //     size.width*0.00,
// //     [
// //       Color(0xff2906be),
// //       Color(0xff000000),
// //       Color(0xff000000),
// //       Color(0xff000000),
// //       Color(0xff000000),
// //       Color(0xffffffff),
// //       ],
// //       [0.00,0.20,0.43,0.44,0.68,1.00],); 

         
// //     Path path0 = Path();
// //     path0.moveTo(size.width*-0.0037917,size.height*0.0001892);
// //     path0.quadraticBezierTo(size.width*0.2607917,size.height*0.0001892,size.width*0.3128750,size.height*0.0001892);
// //     path0.cubicTo(size.width*0.3842292,size.height*0.0452825,size.width*0.4019375,size.height*0.0787084,size.width*0.4107917,size.height*0.1401993);
// //     path0.cubicTo(size.width*0.4212083,size.height*0.1906534,size.width*0.3993333,size.height*0.2297553,size.width*0.3170417,size.height*0.2575050);
// //     path0.quadraticBezierTo(size.width*0.2279792,size.height*0.3265641,0,size.height*0.2701186);
// //     path0.lineTo(0,size.height*0.4719349);
// //     path0.quadraticBezierTo(size.width*0.3061875,size.height*0.3809157,size.width*0.4593542,size.height*0.5518037);
// //     path0.cubicTo(size.width*0.6388542,size.height*0.6625252,size.width*0.4638958,size.height*0.6437563,size.width*0.5191250,size.height*0.7506937);
// //     path0.quadraticBezierTo(size.width*0.6073750,size.height*0.8139884,size.width*0.4941250,size.height*0.8793517);
// //     path0.lineTo(size.width*0.3462083,size.height*1.0027750);
// //     path0.lineTo(size.width*0.0003750,size.height*1.0015136);
// //     path0.lineTo(size.width*-0.0037917,size.height*0.0001892);
// //     path0.close();

// //     canvas.drawPath(path0, paint0);
  
    
// //   }

// //   @override
// //   bool shouldRepaint(covariant CustomPainter oldDelegate) {
// //     return true;
// //   }
  
// // }
