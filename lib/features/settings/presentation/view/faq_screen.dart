import 'package:eshop/app.dart';
import 'package:eshop/core/network/api_service.dart';
import 'package:eshop/core/network/endpoints.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_bar.dart';
import 'package:eshop/features/settings/presentation/widgets/faq_shimmer.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  dynamic response = {};
  bool isLoading = true;
  Future<void> getFaqs() async {
    try {
      response = await ApiService.getData(endPoint: ApiConstants.faqs);
      safePrint(response);
    } catch (e) {
      safePrint("Error fetching FAQs: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getFaqs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              title: S().faq,
            ),
            Expanded(
              child: isLoading
                  ? FaqShimmer()
                  : response["data"]?['data'] != null &&
                  response["data"]['data'].isNotEmpty
                  ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: response["data"]['data'].length,
                itemBuilder: (BuildContext context, int index) {
                  final question = response["data"]['data'][index]["question"] ?? "";
                  final answer = response["data"]['data'][index]["answer"] ?? "";
                  return Container(
                    margin: EdgeInsets.all(5.sp),
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question.toString(),
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp,
                          ),
                        ),
                        verticalSpacing(10),
                        Text(
                          answer.toString(),
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  );
                },
              )
                  : Center(child: Text(S().noProductsInFav)),
            ),

          ],
        ),
      ),
    );
  }
}