import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/auth/login/presentation/view/screens/login_screen.dart';
import 'package:eshop/features/auth/register/presentation/view/screens/register_screen.dart';
import 'package:eshop/features/cart/presentation/pages/cart_screen.dart';
import 'package:eshop/features/check_out/presentation/checkOut_args.dart';
import 'package:eshop/features/check_out/presentation/pages/check_out_screen.dart';
import 'package:eshop/features/main_screen/view/screen/main_screen.dart';
import 'package:eshop/features/more/presentation/pages/privacy_screen.dart';
import 'package:eshop/features/on_bording/view/screens/dash_board_screen.dart';
import 'package:eshop/features/product_details/presentation/view/pages/prodct_details_screen.dart';
import 'package:eshop/features/product_details/presentation/view/product_details_args.dart';
import 'package:eshop/features/profile/presentation/pages/delete_account_screen.dart';
import 'package:eshop/features/profile/presentation/pages/profile_screen.dart';
import 'package:eshop/features/search/presentation/pages/search_screen.dart';
import 'package:eshop/features/settings/presentation/view/faq_screen.dart';
import 'package:eshop/features/settings/presentation/view/help_screen.dart';
import 'package:eshop/features/settings/presentation/view/report_screen.dart';
import 'package:eshop/features/settings/presentation/view/settings_screen.dart';
import 'package:eshop/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteServices {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    safePrint('generateRoute => ${routeSettings.name}');
    safePrint('generateRoute => ${routeSettings.arguments}');

    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.dashboard:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BuyerRegisterScreen(),
        );
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => MainScreen(),
        );
      case Routes.productDetailsScreen:
        return MaterialPageRoute(

          builder: (_) {
            final args = routeSettings.arguments as ProductDetailsArgs;
            return ProductDetailsScreen(args: args,);
          },
        );
      case Routes.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
        );     case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => SearchScreen(),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => CartScreen(),
        );
      case Routes.checkOutScreen:
        return MaterialPageRoute(
          builder: (_) {
            final args = routeSettings.arguments as CheckOutArgs;
            return CheckOutScreen(checkOutArgs: args,);
          },
        );
      case Routes.reportScreen:
        return MaterialPageRoute(
          builder: (_) => ReportScreen(),
        );
      case Routes.helpScreen:
        return MaterialPageRoute(
          builder: (_) => HelpScreen(),
        );
        case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );
        case Routes.deleteScreen:
        return MaterialPageRoute(
          builder: (_) => DeleteAccountScreen(),
        );
   case Routes.privacyScreen:
        return MaterialPageRoute(
          builder: (_) => PrivacyScreen(),
        );   case Routes.faqScreen:
        return MaterialPageRoute(
          builder: (_) => FaqScreen(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Page Not Found"),
        ),
      );
    });
  }
}
