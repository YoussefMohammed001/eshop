import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AppDateTime {
  static String utcToLocalTime(String timestamp) {
    initializeDateFormatting(MyShared.getCurrentLanguage());

    final dateTime = DateTime.parse(timestamp);

    final localTime = dateTime.toUtc().toLocal();

    return DateFormat("yyyy-MM-dd HH:mm a", "en").format(localTime);
  }

  static String utcToLocalDateOnly(String timestamp) {
    initializeDateFormatting(MyShared.getCurrentLanguage());

    final dateTime = DateTime.parse(timestamp);

    final localTime = dateTime.toUtc().toLocal();

    return DateFormat("yyyy-MM-dd", "en").format(localTime);
  }

  static String timestampToFormatted(String timestamp) {
    initializeDateFormatting(MyShared.getCurrentLanguage());
    return DateFormat("yyyy-MM-dd HH:mm a", "en")
        .format(DateTime.parse(timestamp));
  }
}
