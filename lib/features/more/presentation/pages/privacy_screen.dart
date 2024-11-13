import 'package:eshop/core/widgets/app_bar.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: S().faq)
        ],
      ),
    ));
  }
}
