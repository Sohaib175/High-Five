import 'package:flutter/material.dart';
import 'package:high_five/utill/Constants/const_color.dart';

// class LoginBGTop1 extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0 = Paint()
//       ..color = ConstColors.onTertiaryColor
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1.0;
//     Path path0 = Path();
//     path0.moveTo(size.width * 0.4970682, 0);
//     path0.quadraticBezierTo(size.width * 0.2060852, size.height * 0.0009460,
//         size.width * 0.1090909, size.height * 0.0012614);
//     path0.cubicTo(size.width * 0.0072273, size.height * 0.0029516, 0,
//         size.height * 0.0231080, 0, size.height * 0.0618063);
//     path0.cubicTo(0, size.height * 0.2015010, size.width * 0.0011364,
//         size.height * 0.4808905, 0, size.height * 0.6205853);
//     path0.cubicTo(
//         size.width * 0.3153182,
//         size.height * 0.5377397,
//         size.width * 0.5612045,
//         size.height * 0.3350782,
//         size.width * 0.8007727,
//         size.height * 0.1917129);
//     path0.cubicTo(
//         size.width * 0.8795227,
//         size.height * 0.1395812,
//         size.width * 1.0067500,
//         size.height * 0.0773713,
//         size.width * 0.8613636,
//         0);
//     path0.quadraticBezierTo(
//         size.width * 0.7702898, 0, size.width * 0.4970682, 0);
//     path0.close();
//     canvas.drawPath(path0, paint0);
//     Paint paint1 = Paint()
//       ..color = ConstColors.tertiaryColor
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1.0;
//     Path path1 = Path();
//     path1.moveTo(size.width * 0.6303182, 0);
//     path1.lineTo(size.width * 0.5613636, size.height * 0.0012614);
//     path1.quadraticBezierTo(size.width * 0.6278580, size.height * 0.0425832,
//         size.width * 0.6659318, size.height * 0.0626640);
//     path1.cubicTo(
//         size.width * 0.7611818,
//         size.height * 0.1163597,
//         size.width * 0.8107727,
//         size.height * 0.1197149,
//         size.width * 0.8522727,
//         size.height * 0.0946014);
//     path1.quadraticBezierTo(size.width * 0.8892045, size.height * 0.0709511,
//         size.width * 0.9886364, 0);
//     path1.lineTo(size.width * 0.9318182, size.height * 0.0012614);
//     path1.quadraticBezierTo(size.width * 0.8653409, size.height * 0.0466700,
//         size.width * 0.8431818, size.height * 0.0618063);
//     path1.cubicTo(
//         size.width * 0.7988864,
//         size.height * 0.0948032,
//         size.width * 0.7746136,
//         size.height * 0.0826060,
//         size.width * 0.6871364,
//         size.height * 0.0357467);
//     path1.quadraticBezierTo(size.width * 0.6729318, size.height * 0.0268100,
//         size.width * 0.6303182, 0);
//     path1.close();
//    canvas.drawPath(path1, paint1);
//   }
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

class LoginBGTop extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = ConstColors.tertiaryContainerColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4869281, 0);
    path0.quadraticBezierTo(
        size.width * 0.7687908, 0, size.width * 0.8627451, 0);
    path0.cubicTo(
        size.width * 0.9697712,
        size.height * 0.0899705,
        size.width * 0.9616013,
        size.height * 0.1533923,
        size.width * 0.7614379,
        size.height * 0.3112094);
    path0.cubicTo(
        size.width * 0.5911111,
        size.height * 0.3930678,
        size.width * 0.5637255,
        size.height * 0.5058997,
        size.width * 0.5326797,
        size.height * 0.6002950);
    path0.cubicTo(size.width * 0.5171569, size.height * 0.7061062,
        size.width * 0.1883333, size.height * 0.9351032, 0, size.height);
    path0.cubicTo(0, size.height * 0.7684366, 0, size.height * 0.3053097, 0,
        size.height * 0.0737463);
    path0.cubicTo(
        size.width * 0.0057190,
        size.height * 0.0095870,
        size.width * 0.0351307,
        size.height * 0.0051622,
        size.width * 0.0882353,
        0);
    path0.quadraticBezierTo(
        size.width * 0.1879085, 0, size.width * 0.4869281, 0);
    path0.close();

    canvas.drawPath(path0, paint0);

    Paint paint1 = Paint()
      ..color = ConstColors.onTertiaryContainerColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path1 = Path();
    path1.moveTo(size.width * 0.7091503, size.height * 0.0648968);
    path1.lineTo(size.width * 0.6274510, 0);
    path1.lineTo(size.width * 0.5555556, 0);
    path1.quadraticBezierTo(size.width * 0.6879085, size.height * 0.1028761,
        size.width * 0.7352941, size.height * 0.1371681);
    path1.cubicTo(
        size.width * 0.7834967,
        size.height * 0.1722124,
        size.width * 0.8202614,
        size.height * 0.1710914,
        size.width * 0.8464052,
        size.height * 0.1474926);
    path1.quadraticBezierTo(size.width * 0.8774510, size.height * 0.1157817,
        size.width * 0.9705882, size.height * 0.0206490);
    path1.lineTo(size.width * 0.9444444, 0);
    path1.lineTo(size.width * 0.9313725, size.height * 0.0029499);
    path1.quadraticBezierTo(size.width * 0.8553922, size.height * 0.0759587,
        size.width * 0.8300654, size.height * 0.1002950);
    path1.quadraticBezierTo(size.width * 0.7998366, size.height * 0.1379056,
        size.width * 0.7581699, size.height * 0.1032448);
    path1.lineTo(size.width * 0.7091503, size.height * 0.0648968);
    path1.close();

    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LoginBGBottom extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = ConstColors.tertiaryContainerColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();

    path0.moveTo(size.width * 0.3333333, size.height * 0.4065041);
    path0.quadraticBezierTo(size.width * 0.1833333, size.height * 0.5772358,
        size.width * 0.1333333, size.height * 0.6341463);
    path0.quadraticBezierTo(size.width * -0.0762500, size.height * 0.8528455,
        size.width * 0.1500000, size.height);
    path0.quadraticBezierTo(size.width * 0.6625000, size.height,
        size.width * 0.8833333, size.height);
    path0.cubicTo(
        size.width * 0.9319167,
        size.height * 0.9552033,
        size.width * 0.9564167,
        size.height * 0.9407317,
        size.width,
        size.height * 0.8130081);
    path0.quadraticBezierTo(size.width, size.height * 0.6849593, size.width,
        size.height * 0.3008130);
    path0.quadraticBezierTo(size.width * 0.8812500, size.height * 0.1971545,
        size.width * 0.8416667, size.height * 0.1626016);
    path0.quadraticBezierTo(size.width * 0.7015833, size.height * 0.0469919,
        size.width * 0.5500000, size.height * 0.1626016);
    path0.lineTo(size.width * 0.3333333, size.height * 0.4065041);
    path0.close();

    canvas.drawPath(path0, paint0);

    Paint paint1 = Paint()
      ..color = ConstColors.onTertiaryContainerColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path1 = Path();

    path1.moveTo(size.width, size.height * 0.0081301);
    path1.lineTo(size.width * 0.6666667, size.height * 0.3821138);
    path1.quadraticBezierTo(size.width * 0.5876667, size.height * 0.5047154,
        size.width * 0.6750000, size.height * 0.6097561);
    path1.cubicTo(
        size.width * 0.7437500,
        size.height * 0.6747967,
        size.width * 0.8979167,
        size.height * 0.8048780,
        size.width * 0.9833333,
        size.height * 0.8699187);
    path1.quadraticBezierTo(size.width * 1.0087500, size.height * 0.8257724,
        size.width, size.height * 0.7317073);
    path1.quadraticBezierTo(size.width * 0.8416667, size.height * 0.6097561,
        size.width * 0.7916667, size.height * 0.5691057);
    path1.cubicTo(
        size.width * 0.7227500,
        size.height * 0.5072358,
        size.width * 0.7603333,
        size.height * 0.4509756,
        size.width * 0.8000000,
        size.height * 0.4065041);
    path1.quadraticBezierTo(size.width * 0.8500000, size.height * 0.3489431,
        size.width, size.height * 0.1762602);
    path1.lineTo(size.width, size.height * 0.0081301);
    path1.close();

    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
