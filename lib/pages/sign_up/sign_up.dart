import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:ulearning_app/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:ulearning_app/pages/sign_up/bloc/sign_up_event.dart';
import 'package:ulearning_app/pages/sign_up/bloc/sign_up_state.dart';
import 'package:ulearning_app/pages/sign_up/sign_up_controller.dart';
import '../common_widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Container(
          color: AppColors.primaryBackground,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.primaryBackground,
              appBar: appBarWidget("Sign Up"),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      Center(
                        child: reusableText(
                            "Enter your details below & free sign up"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText('Username'),
                            reusableTextFormField(
                              "Enter your username",
                              "username",
                              false,
                              "user",
                              (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(UsernameEvent(username: value));
                              },
                            ),
                            SizedBox(height: 15.h),
                            reusableText('Email'),
                            reusableTextFormField(
                              "Enter your email",
                              "email",
                              false,
                              "user",
                              (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(EmailEvent(email: value));
                              },
                            ),
                            SizedBox(height: 15.h),
                            reusableText('Password'),
                            reusableTextFormField(
                              "Enter your password",
                              "password",
                              true,
                              "lock",
                              (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(PasswordEvent(password: value));
                              },
                            ),
                            SizedBox(height: 15.h),
                            reusableText('Confirm Password'),
                            reusableTextFormField(
                              "Confirm your password",
                              "password",
                              true,
                              "lock",
                              (value) {
                                context.read<SignUpBloc>().add(
                                    ConfirmPasswordEvent(
                                        confirmPassword: value));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        margin: EdgeInsets.only(bottom: 5.h),
                        child: Text(
                          "By creating an account you have to agree\nwith our terms & conditions",
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.primaryFourthElementText,
                          ),
                        ),
                      ),
                      //  TODO When designsize is mentioned in main.dart then use this sizedBox...
                      SizedBox(height: 50.h),
                      signInSignUpButtons(
                        "Sign Up",
                        "login",
                        () {
                          SignUpController(context).handleSignUp();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
