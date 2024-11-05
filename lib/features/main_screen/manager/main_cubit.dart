import 'package:bloc/bloc.dart';
import 'package:eshop/features/fav/presentation/pages/fav_screen.dart';
import 'package:eshop/features/home/presentation/pages/home_screen.dart';
import 'package:eshop/features/more/presentation/pages/more_screen.dart';
import 'package:eshop/features/products/presentation/pages/products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(ChangeScreen(widget: HomeScreen()));
  List<Widget> screens = [
    HomeScreen(),
    ProductsScreen(),
    FavScreen(),
    MoreScreen(),
  ];

  int index = 0;


  void changeIndex(int newIndex) {
    index = newIndex;
    emit(ChangeScreen(widget: screens[index]));
  }
}
