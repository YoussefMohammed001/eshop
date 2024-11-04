import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSVG extends StatelessWidget {
  const AppSVG({
    Key? key,
    required this.assetName,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  final String assetName;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    String assetPath = assetName;
    if (!assetPath.contains('svg')) {
      assetPath = "assets/images/svgs/$assetPath.svg";
    }
    
    return SvgPicture.asset(
      assetPath,
      height: height,
      width: width,
      color: color,
    );
  }
}
