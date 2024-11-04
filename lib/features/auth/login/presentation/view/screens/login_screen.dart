import 'package:eshop/core/di/di.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_logo.dart';
import 'package:eshop/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:eshop/features/auth/login/presentation/view/widgets/login_form.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final cubit = LoginCubit(getIt());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpacing(50),
                AppLogo(),
                verticalSpacing(20),
                Center(
                  child: Text(
                    S().login,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                verticalSpacing(25),
                LoginForm(cubit: cubit,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}