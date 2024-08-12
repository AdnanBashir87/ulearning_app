import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/sign_in_controller.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:ulearning_app/common/routes/route_names.dart';
import '../../common/values/colors.dart';
import '../common_widgets.dart';
import 'bloc/sign_in_bloc.dart';
import 'bloc/sign_in_event.dart';
import 'bloc/sign_in_state.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: AppColors.primaryBackground,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.primaryBackground,
              appBar: appBarWidget("Log In"),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      thirdPartyLogin(),
                      Center(
                          child:
                              reusableText("Or use your email account login")),
                      Container(
                        margin: EdgeInsets.only(top: 50.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText('Email'),
                            reusableTextFormField(
                              "Enter your email",
                              "email",
                              false,
                              "user",
                              (p0) {
                                context
                                    .read<SignInBloc>()
                                    .add(EmailEvent(email: p0));
                              },
                            ),
                            SizedBox(height: 15.h),
                            reusableText('Password'),
                            reusableTextFormField(
                              "Enter your Password",
                              "password",
                              true,
                              "lock",
                              (p0) {
                                context
                                    .read<SignInBloc>()
                                    .add(PasswordEvent(password: p0));
                              },
                            ),
                          ],
                        ),
                      ),
                      forgetPassword(),
                      //  TODO When designsize is mentioned in main.dart then use this sizedBox...
                      SizedBox(height: 70.h),
                      signInSignUpButtons(
                        "Log In",
                        "login",
                        () {
                          SignInController(context).handleSignIn("email");
                        },
                      ),
                      signInSignUpButtons(
                        "Sign Up",
                        "signup",
                        () {
                          Navigator.of(context).pushNamed(AppRoutes.SIGN_UP);
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
