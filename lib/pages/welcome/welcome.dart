import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/global.dart';

import '../../common/values/colors.dart';
import '../../common/routes/route_names.dart';
import 'bloc/welcome_bloc.dart';
import 'bloc/welcome_event.dart';
import 'bloc/welcome_state.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 40.w),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      state.page = value;
                      context.read<WelcomeBloc>().add(WelcomeEvent());
                    },
                    children: [
                      page(
                        1,
                        context,
                        "First See Learning",
                        "Forget about a for of paper all knowledge\nis one learning!",
                        "assets/images/reading.png",
                        "Next",
                      ),
                      page(
                        2,
                        context,
                        "Connect With Everyone",
                        "Always keep in touch with you tutor &\nfriends. Let's get connected",
                        "assets/images/boy.png",
                        "Next",
                      ),
                      page(
                        3,
                        context,
                        "Always Facinated Learning",
                        "Anywhere anytime. The time is at your\ndiscretion so study whenever you want",
                        "assets/images/man.png",
                        "Get Started",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 90.h,
                    child: DotsIndicator(
                      position: state.page,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryFourthElementText,
                        activeColor: AppColors.primaryElement,
                        size: Size(8.w, 8.w),
                        activeSize: Size(15.w, 8.w),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      dotsCount: 3,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget page(
    int pNo,
    BuildContext context,
    String title,
    String subtitle,
    String imagePath,
    String buttonName,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Center(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 20.w,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          alignment: Alignment.center,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        //  TODO When designsize is mentioned in main.dart then use this sizedBox...
        SizedBox(height: 50.h),
        GestureDetector(
          onTap: () {
            if (pNo < 3) {
              _pageController.animateToPage(
                pNo,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            } else {
              Global.storageService.setBool(
                AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME,
                true,
              );
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.SIGN_IN,
                (route) => false,
              );
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 80.h,
              left: 25.w,
              right: 25.w,
            ),
            alignment: Alignment.center,
            width: 335.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                    color: Colors.grey.withOpacity(0.5),
                  )
                ]),
            child: Text(
              buttonName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
