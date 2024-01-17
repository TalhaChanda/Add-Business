import 'package:flutter/material.dart';

DecorationImage containerImage(String? image, {BoxFit? fit}) {
  return DecorationImage(
      image: AssetImage(image.toString()), fit: fit ?? BoxFit.contain);
}
