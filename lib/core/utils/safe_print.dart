import 'package:flutter/foundation.dart';

void safePrint(Object? message){
  if (kDebugMode) {
    print('=> - - - - - SAFE PRINT - - - - - <=');
    print(message);
    print('=> - - - - - SAFE PRINT - - - - - <=');
  }
}