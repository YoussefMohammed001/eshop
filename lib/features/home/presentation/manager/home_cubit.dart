import 'package:bloc/bloc.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/home/domain/entities/home_entities.dart';
import 'package:eshop/features/home/domain/use_cases/home_usecase.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeUseCase) : super(HomeInitial());
 final HomeUseCase homeUseCase;
  bool isLoading = false;
 HomeEntities homeEntities = HomeEntities(banners: [], products: []);
  Future<void> getHomeData() async {
    isLoading  =true;
    emit(HomeLoading());
    try {
      final homeEntities = await homeUseCase.execute();
      this.homeEntities = homeEntities;
      isLoading = false;
      emit(HomeSuccess(homeEntities));
    } catch (e) {
      safePrint("cubit error===========> $e");
      emit(HomeFailure(e.toString()));
    }
  }
}
