import 'package:bloc/bloc.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/auth/login/data/model/login_request_model.dart';
import 'package:eshop/features/auth/login/data/repo_imp/login_repo.dart';
import 'package:eshop/features/auth/login/presentation/manager/login_state.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future login() async {
    emit(LoginLoading());
      final response = await loginRepo.login(loginRequestModel: LoginRequestModel(email: emailController.text, password: passwordController.text));
      if(response.status == true){
        emit(LoginLoaded());
        emailController.clear();
        passwordController.clear();
      }else{
        safePrint(response.message);
        safePrint("failure");
        emit(LoginFailure(message: response.message!));
        emailController.clear();
        passwordController.clear();
      }

  }



}
