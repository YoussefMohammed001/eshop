import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/snack.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/validators.dart';
import 'package:eshop/core/widgets/app_button.dart';
import 'package:eshop/core/widgets/app_text_field.dart';
import 'package:eshop/features/auth/register/data/model/register_req.dart';
import 'package:eshop/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:eshop/features/auth/register/presentation/view/widgets/already_have_account.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoaded) {
          pushNamedAndRemoveUntil(context, Routes.loginScreen);
          snackBar(context, state.message, AppColors.primary);
        }
        if (state is RegisterFailed) {
          snackBar(context, state.message, AppColors.error);
        }
      },
      child: Form(
        key: widget.cubit.formKey,
        child: Column(
          children: [
            AppTextField(
              withTitle: true,
              title: S().username,
              hintText: S().username,
              controller: widget.cubit.nameController,
              validator: (v) {
                if (v.isEmpty) {
                  return S().emptyName;
                }
                return null;
              },
            ),
            AppTextField(
              withTitle: true,
              title: S().email,
              hintText: S().email,
              controller: widget.cubit.emailController,
              validator: (v) {
                if (v.isEmpty) {
                  return S().enterYourEmail;
                }
                return null;
              },
            ),
            AppTextField(
              withTitle: true,
              title: S().phone,
              hintText: S().phone,
              controller: widget.cubit.phoneController,
              validator: (v) {
                if (v.isEmpty) {
                  return S().emptyPhone;
                }
                return null;
              },
            ),
            AppTextField(
              withTitle: true,
              title: S().password,
              hintText: S().password,
              controller: widget.cubit.passwordController,
              validator: (v) {
                if (v.isEmpty) {
                  return S().enterYourPassword;
                }
                if(v.toString().length < 8){
                  return S().passwordLengthInvalid;
                }
                return null;
              },
            ),
            AppTextField(
              withTitle: true,
              title: S().confirmPassword,
              hintText: S().confirmPassword,
              controller: widget.cubit.passwordConfirmationController,
              validator: (v) {
                if (v.isEmpty) {
                  return S().confirmPassword;
                }

                if (!Validators.isPasswordConfirmed(widget.cubit.passwordController.text,v )) {
                  return S().confirmPasswordNotMatch;
                }

                return null;
              },
            ),
            verticalSpacing(20),
            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return state is RegisterLoading
                    ? CircularProgressIndicator()
                    : AppButton(
                        onPressed: () {
                          if (widget.cubit.formKey.currentState!.validate()) {
                            widget.cubit.register(
                                registerRequestModel: RegisterRequestModel(
                              name: widget.cubit.nameController.text,
                              phone: widget.cubit.phoneController.text,
                              password: widget.cubit.passwordController.text, email: widget.cubit.emailController.text,

                            ));
                          }
                        },
                        label: S().register,
                        width: 338.w,
                        height: 56.h,
                      );
              },
            ),
            verticalSpacing(20),
            AlreadyHaveAccount(),
            verticalSpacing(20),

          ],
        ),
      ),
    );
  }
}
