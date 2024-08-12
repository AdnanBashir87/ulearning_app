import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar appBarWidget(String title) {
  return AppBar(
    backgroundColor: AppColors.primaryBackground,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 0.5,
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryText,
      ),
    ),
    centerTitle: true,
  );
}
