import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/shared_preferences/my_shared_keys.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.fit,
  });

  final String imageUrl;
  final double width;
  final double height;
  final BorderRadius borderRadius;

  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        httpHeaders: {
          "Authorization":
              "Bearer ${MyShared.getString(key: MySharedKeys.apiToken)}"
        },
        fit: fit ?? BoxFit.fill,
        width: width,
        height: height,
        imageUrl: imageUrl,

        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Center(
            child: Image.asset("assets/images/gif/loading-gif.gif",
            height: 30.h,
              width: 30.w,
            )
          );
        },
        errorWidget: (context, url, error) => Icon(Icons.error_outline,
        color: AppColors.primary,
        )
        // const SizedBox(
        //     width: double.infinity,
        //     child: Icon(Icons.error)),
      ),
    );
  }
}

