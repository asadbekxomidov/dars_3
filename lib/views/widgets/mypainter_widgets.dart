// import 'dart:ui' as ui;

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/semantics.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   ui.Image? image;

//   Future<void> loadImage() async {
//     final ByteData data = await rootBundle.load("images/imagestiger.jpg");
//     final Uint8List bytes = data.buffer.asUint8List();
//     final ui.Codec codec = await ui.instantiateImageCodec(bytes);
//     final ui.FrameInfo frameInfo = await codec.getNextFrame();
//     image = frameInfo.image;
//   }

//   @override
//   void initState() {
//     super.initState();
//     loadImage().then(
//       (_) {
//         setState(() {});
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "",
//           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: CustomPaint(
//           size: const Size(300, 300),
//           painter: MyPainter(image),
//           // child: ,
//         ),
//       ),
//     );
//   }
// }

// class MyPainter extends CustomPainter {
//   final ui.Image? image;

//   MyPainter(this.image);
//   @override
//   void paint(Canvas canvas, Size size) {
//     const rect = Rect.fromLTWH(50, 50, 200, 100);
//     if (image != null) {
//       // canvas.drawImage(image!, Offset.zero, Paint());
//       paintImage(canvas: canvas, rect: rect, image: image!);
//     }

//     var paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 5;
//     canvas.drawRect(rect, paint);
//     // var paint = Paint()
//     //   ..color = Colors.blue
//     //   ..style = PaintingStyle.stroke
//     //   ..strokeWidth = 5;
//     // var paint2 = Paint()
//     //   ..color = Colors.blue
//     //   ..style = PaintingStyle.fill
//     //   ..strokeWidth = 5;
//     // var paint3 = Paint()
//     //   ..color = Colors.red
//     //   ..style = PaintingStyle.fill
//     //   ..strokeWidth = 5;

//     paint.color = Colors.red;
//     // canvas.drawDRRect(RRect.fromLTRBAndCorners(50, 15, 200, 5));

//     var textPainter = TextPainter(
//         text: TextSpan(
//           text: "Salom, Flutter!",
//           style: TextStyle(color: Colors.black, fontSize: 35),
//         ),
//         textDirection: TextDirection.ltr);

//     textPainter.layout(minWidth: 0, maxWidth: size.width);
//     var offset = Offset(40, 80);
//     textPainter.paint(canvas, offset);

//     // var path = Path();
//     // path.moveTo(size.width / 2, size.height / 2 - 50);
//     // path.lineTo(size.width / 2 + 40, size.height / 2 + 50);
//     // path.lineTo(size.width / 2 - 45, size.height / 2 - 15);
//     // path.lineTo(size.width / 2 + 45, size.height / 2 - 15);
//     // path.lineTo(size.width / 2 - 40, size.height / 2 + 50);

//     // path.close();
//     // canvas.drawPath(path, paint3);

//     // var rect = const Rect.fromLTWH(10, 400, 300, 100);
//     // canvas.drawOval(rect, paint2);

//     // var rect2 = Rect.fromLTWH(80, 150, 150, 220);
//     // canvas.drawRect(rect2, paint2);

//     // canvas.drawCircle(Offset(size.width / 7, size.height / 1000), 100, paint);
//     // canvas.drawCircle(Offset(size.width / 1.2, size.height / 1000), 100, paint);
//     // canvas.drawCircle(Offset(size.width / 7, size.height / 1000), 20, paint2);
//     // canvas.drawCircle(Offset(size.width / 1.2, size.height / 1000), 20, paint2);
//   }

//   @override
//   bool shouldRepaint(covariant MyPainter oldDelegate) {
//     return oldDelegate.image != image;
//   }
// }

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    final ByteData data = await rootBundle.load('images/imagestiger.jpg');
    final Uint8List bytes = data.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    setState(() {
      image = frameInfo.image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Custom Painter',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: CustomPaint(
          size: const Size(300, 300),
          painter: MyPainter(image),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final ui.Image? image;

  MyPainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    if (image != null) {
      canvas.drawImage(image!, Offset.zero, Paint());
    }

    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5;
    canvas.drawRect(Rect.fromLTWH(50, 50, 200, 100), paint);

    paint.color = Colors.red;
    canvas.drawRRect(
      RRect.fromLTRBAndCorners(50, 15, 200, 5),
      paint,
    );

    canvas.drawRect(
        Rect.fromCenter(center: Offset.zero, width: 100, height: 100), paint);

    var textPainter = TextPainter(
      text: const TextSpan(
        text: 'Salom, Flutter!',
        style: TextStyle(color: Colors.black, fontSize: 35),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);
    var offset = Offset(40, 80);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
