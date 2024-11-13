import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

class FaqShimmer extends StatefulWidget {
  const FaqShimmer({super.key});

  @override
  State<FaqShimmer> createState() => _FaqShimmerState();
}

class _FaqShimmerState extends State<FaqShimmer> {
  bool isThemeDark = true;
  late Color bgColor;
  late ShimmerProLight shimmerlight;

  void _themeMode() {
    isThemeDark = !isThemeDark;
    if (isThemeDark) {
      setState(() {
        bgColor = const Color.fromARGB(255, 50, 50, 50);
        shimmerlight = ShimmerProLight.lighter;
      });
    } else {
      setState(() {
        bgColor = const Color.fromARGB(255, 240, 240, 240);
        shimmerlight = ShimmerProLight.darker;
      });
    }
  }
  @override
  void initState() {
    _themeMode();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10, // Placeholder shimmer items count
      itemBuilder: (context, index) {

        return    ShimmerPro.generated(
            light: shimmerlight,
            scaffoldBackgroundColor: bgColor,
            child: Column(
              children: [
                Row(
                  children: [
                    ShimmerPro.text(
                      maxLine: 1,
                      light: shimmerlight,
                      scaffoldBackgroundColor: bgColor,
                      width: 100.w,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(

                      child: ShimmerPro.text(
                        maxLine: 1,
                        light: shimmerlight,
                        scaffoldBackgroundColor: bgColor,
                        width: double.infinity,
                      ),
                    )
                  ],
                ),
              ],
            ));
      },
    );
  }
}
