part of 'main_cubit.dart';

@immutable
sealed class MainState {}


final class ChangeScreen extends MainState {
  final Widget widget;
  ChangeScreen({required this.widget});
}
