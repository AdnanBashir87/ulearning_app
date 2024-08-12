import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

Widget thirdPartyLogin() {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        socialMediaIcon("google"),
        SizedBox(width: 40.w),
        socialMediaIcon("apple"),
        SizedBox(width: 40.w),
        socialMediaIcon("facebook"),
      ],
    ),
  );
}

Widget socialMediaIcon(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 40.w,
      width: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryFourthElementText,
      ),
    ),
  );
}

Widget reusableTextFormField(
  String text,
  String textType,
  bool obscureText,
  String iconName,
  Function(String)? onChanged,
) {
  return Container(
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(
        color: AppColors.primaryFourthElementText,
      ),
    ),
    child: Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 15.w),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.w),
          width: 260.w,
          height: 50.h,
          child: TextFormField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: text,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintStyle: TextStyle(
                color: AppColors.primarySecondaryElementText.withOpacity(0.5),
              ),
            ),
            style: TextStyle(
              fontFamily: "Avenir-Book",
              color: AppColors.primaryText,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
            ),
            obscureText: textType == "password" ? true : false,
            autocorrect: false,
          ),
        ),
      ],
    ),
  );
}

Widget forgetPassword() {
  return Container(
    margin: EdgeInsets.only(top: 10.w),
    height: 44.h,
    width: 260.w,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forget password",
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 12.sp,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
        ),
      ),
    ),
  );
}

Widget signInSignUpButtons(
    String buttonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(top: buttonType == "login" ? 50.h : 15.h),
      height: 50.h,
      width: 345.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: buttonType == "login"
                ? Colors.transparent
                : AppColors.primaryFourthElementText,
          ),
          borderRadius: BorderRadius.circular(15.w),
          color: buttonType == "login"
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
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
        style: TextStyle(
          color: buttonType == "login"
              ? AppColors.primaryBackground
              : AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}
