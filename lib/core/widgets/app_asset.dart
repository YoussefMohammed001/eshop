import 'package:flutter/material.dart';

class AppAssetImage extends StatelessWidget {
  const AppAssetImage(
      {super.key,
      required this.image,
      required this.width,
      required this.height,
      required this.topLeftRadius,
      required this.topRightRadius,
      required this.bottomLeftRadius,
      required this.bottomRightRadius,
        this.color,
        this.colorBlendMode,
      required this.fit});
  final String image;
  final double width;
  final double height;
  final BoxFit fit;

  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final Color? color;
  final BlendMode? colorBlendMode;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeftRadius),
        topRight: Radius.circular(topRightRadius),
        bottomRight: Radius.circular(bottomRightRadius),
        bottomLeft: Radius.circular(bottomLeftRadius),
      ),
      child: Image.asset(
color: color,
colorBlendMode: colorBlendMode,
        "assets/images/pngs/$image.png",
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
