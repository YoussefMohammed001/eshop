import 'package:eshop/core/di/di.dart';
import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_logo.dart';
import 'package:eshop/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:eshop/features/auth/register/presentation/view/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerRegisterScreen extends StatelessWidget {
  BuyerRegisterScreen({super.key,});


  final cubit = RegisterCubit(getIt());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterLoaded){
            pushNamedAndRemoveUntil(context, Routes.mainScreen);
          }
        },
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpacing(50),
                  AppLogo(),
                  verticalSpacing(20),
                  RegisterForm(cubit: cubit,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
