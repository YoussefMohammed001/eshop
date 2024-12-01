import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/core/utils/snack.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_button.dart';
import 'package:eshop/core/widgets/app_text_field.dart';
import 'package:eshop/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:eshop/features/auth/login/presentation/manager/login_state.dart';
import 'package:eshop/features/auth/login/presentation/view/widgets/dont_have_account.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.cubit});

  final LoginCubit cubit;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          snackBar(context, state.message, AppColors.error);
        }
        if (state is LoginLoaded) {
            safePrint("isVerified");
            pushNamedAndRemoveUntil(context, Routes.mainScreen);

        }
      },
      child: Form(
        key: widget.cubit.formKey,
        child: Column(
          children: [
            AppTextField(
              withTitle: true,
              title: S().email,
              hintText: S().email,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: widget.cubit.emailController,
              validator: (v) {
                if (v!.isEmpty) {
                  return S().enterYourEmail;
                }
                return null;
              },
            ),
            AppTextField(
              withTitle: true,
              title: S().password,
              hintText: S().password,
              keyboardType: TextInputType.text,
              controller: widget.cubit.passwordController,
              validator: (v) {
                if (v!.isEmpty) {
                  return S().enterYourPassword;
                }
                return null;
              },
            ),
            verticalSpacing(10),
            GestureDetector(
              onTap: () {
                pushNamed(context, Routes.forgetPassScreen);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.sp),
                alignment: Alignment.centerRight,
                child: Text(S().forgetPassword,
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp)),
              ),
            ),
            verticalSpacing(10),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return state is LoginLoading
                    ? const CircularProgressIndicator()
                    : AppButton(
                  onPressed: () {
                    if (!widget.cubit.isClosed &&
                        widget.cubit.formKey.currentState!.validate()) {
                      widget.cubit.login();
                    }
                  },
                  label: S().login,
                  width: 338.w,
                  height: 56.h,
                  borderRadius: BorderRadius.circular(16.r),
                );
              },
            ),
            verticalSpacing(15),
            DontHaveAccountWidget(),
          ],
        ),
      ),
    );
  }
}