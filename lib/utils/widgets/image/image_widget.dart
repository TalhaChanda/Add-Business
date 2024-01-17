import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  String? image;
  double? width, height;
  BoxFit? fit;

   ImageWidget({this.image, this.fit, this.height, this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        image.toString(),
        fit: fit ?? BoxFit.contain,
      ),
    );
  }
}
