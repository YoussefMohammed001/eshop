import 'package:bloc/bloc.dart';
import 'package:eshop/features/auth/register/data/model/register_req.dart';
import 'package:eshop/features/auth/register/data/repo/register_repo.dart';
import 'package:flutter/cupertino.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordConfirmationController = TextEditingController();
final formKey = GlobalKey<FormState>();
  Future register({required RegisterRequestModel registerRequestModel})async{
    emit(RegisterLoading());
    final response = await registerRepo.register(request: registerRequestModel);
    if(response.status == true){
      emit(RegisterLoaded(response.message!));
    }else{
      emit(RegisterFailed(message: response.message!));
    }

  }

}
