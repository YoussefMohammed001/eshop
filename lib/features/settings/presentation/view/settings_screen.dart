
import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/widgets/app_bar.dart';
import 'package:eshop/features/more/presentation/widgets/more_item.dart';
import 'package:eshop/features/settings/presentation/widgets/language_widget.dart';
import 'package:eshop/features/settings/presentation/widgets/theme_widget.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: S().setting,result: true,),
            MoreItem(image: "report", text: S().report, onTap: (){
              pushNamed(context, Routes.reportScreen);
            }, themeMode: MyShared.getThemeMode(),),
            MoreItem(image: "help", text: S().help, onTap: (){
              pushNamed(context, Routes.helpScreen);

            }, themeMode: MyShared.getThemeMode(),),
            LanguageWidget(),
          ThemeWidget(),
          ],
        ),

      ),
    );
  }
}
