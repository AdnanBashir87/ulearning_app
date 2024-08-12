import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/route_names.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/global_resuable_widgets.dart';

//  AppBar for profile page
AppBar buildProfileAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 12.h,
            width: 18.w,
            child: Image.asset('assets/icons/menu.png'),
          ),
          reusableText(text: "Profile"),
          GestureDetector(
            onTap: () {
              // TODO profile photo
            },
            child: Container(
              height: 24.h,
              width: 24.w,
              decoration: BoxDecoration(
                // color: Colors.yellow
                borderRadius: BorderRadius.circular(50.r),
                image: const DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/icons/more-vertical.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    height: 80.h,
    width: 80.w,
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/icons/headpic.png"),
      ),
    ),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage("assets/icons/edit_3.png"),
    ),
  );
}

// Widget purchasesOptions() {
//   return Container(
//     width: 325.w,
//     // color: Colors.green,
//     alignment: Alignment.center,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         singlePurchase(),
//         singlePurchase(),
//         singlePurchase(),
//       ],
//     ),
//   );
// }
//
// Widget singlePurchase() {
//   return Container(
//     height: 50.h,
//     width: 90.w,
//     decoration: BoxDecoration(
//       color: AppColors.primaryElement,
//       borderRadius: BorderRadius.circular(10.r),
//     ),
//   );
// }

var imageInfo = <String, String>{
  "settings": "Settings",
  "credit-card": "Payment Details",
  "award": "Achievement",
  "heart_1": "Love",
  "cube": "Learning Reminders",
};

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imageInfo.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
          },
          child: Container(
            width: 325.w,
            // color: Colors.green,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 15.w),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15.w),
                  padding: EdgeInsets.all(7.w),
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Image.asset(
                      "assets/icons/${imageInfo.keys.elementAt(index)}.png"),
                ),
                reusableText(text: imageInfo.values.elementAt(index))
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
