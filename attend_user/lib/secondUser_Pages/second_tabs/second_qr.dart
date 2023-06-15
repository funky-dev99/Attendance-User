import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class SecondQr extends StatefulWidget {
  const SecondQr({Key? key}) : super(key: key);

  @override
  State<SecondQr> createState() => _SecondQrState();
}

class _SecondQrState extends State<SecondQr> {
  ui.Image? image; // Declare ui.Image as a class member

  @override
  void initState() {
    super.initState();
    _loadImage(); // Call _loadImage in the initState method
  }

  Future<void> _loadImage() async {
    final data = await rootBundle.load('assets/qr.png');
    final loadedImage = await decodeImageFromList(data.buffer.asUint8List());
    setState(() {
      image = loadedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    const message = 'My QR';

    final qrCode = image != null // Use the loaded image in FutureBuilder
        ? CustomPaint(
      size: const Size.square(350),
      painter: QrPainter(
        data: message,
        version: QrVersions.auto,
        color: Colors.black,
        emptyColor: Colors.white70,
        embeddedImage: image,
        embeddedImageStyle: QrEmbeddedImageStyle(
          size: Size.square(50),
        ),
      ),
    )
        : Container(
      color: Colors.teal,
      height: 350,
      width: 350,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        qrCode,
        SizedBox(height: 30.0),
        Text(
          message,
          style: TextStyle(fontSize: 25.0,
              fontWeight: FontWeight.bold),
        ),
      ],
    );

  }
}

