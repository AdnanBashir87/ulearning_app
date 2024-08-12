import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import '../../../common/widgets/global_resuable_widgets.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 16.h,
            width: 16.w,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            onTap: () {
              // TODO function to show profile photo
            },
            child: Container(
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(
                // color: Colors.yellow
                borderRadius: BorderRadius.circular(50.r),
                image: const DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/icons/person.png"),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

// text for greetings
Widget homePageText({Color? color, required String text, double top = 20}) {
  return Container(
      margin: EdgeInsets.only(top: top.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24.sp,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ));
}

Widget searchView({void Function(String)? onChanged, void Function()? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 40.h,
        //  TODO When designsize is mentioned in main.dart then use this width else  250
        width: 260.w,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourthElementText),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8.w),
              height: 16.h,
              width: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            SizedBox(
              height: 40.h,
              //  TODO When designsize is mentioned in main.dart then use this width else 224
              width: 234.w,
              child: TextFormField(
                onChanged: onChanged,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 5.h, top: 5.h, bottom: 5.h),
                  hintText: "search your course",
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
                    color:
                        AppColors.primarySecondaryElementText.withOpacity(0.5),
                  ),
                ),
                style: TextStyle(
                  fontFamily: "Avenir-Book",
                  color: AppColors.primaryText,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                ),
                autocorrect: false,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(5.h),
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(10.h),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

///////////////////////////////////////////////////////////////////////////////////
// view for homeCourseSliders
Widget slidersView(BuildContext context, HomeState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(
          top: 20.h,
          bottom: 5.h,
        ),
        height: 160.h,
        width: 325.w,
        // color: AppColors.primaryElement, // Covers whole box or container
        child: PageView(
          onPageChanged: (value) {
            context.read<HomeBloc>().add(PageIndicatorDots(value));
          },
          children: [
            _singleSlide("art"),
            _singleSlide("Image"),
            _singleSlide("Image_1"),
          ],
        ),
      ),
      DotsIndicator(
        position: state.page,
        mainAxisAlignment: MainAxisAlignment.center,
        decorator: DotsDecorator(
          color: AppColors.primaryThirdElementText,
          activeColor: AppColors.primaryElement,
          size: Size.square(5.w),
          activeSize: Size(17.w, 5.w),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        dotsCount: 3,
      ),
    ],
  );
}

// Single Slide
Widget _singleSlide(String image) {
  return Container(
    height: 160.h,
    width: 325.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/icons/$image.png"),
      ),
    ),
  );
}
////////////////////////////////////////////////////////////////////

Widget mainMenu() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h, bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            reusableText(),
            GestureDetector(
              onTap: () {
                //  TODO write your function here
              },
              child: reusableText(
                text: "See all",
                color: AppColors.primaryThirdElementText,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      Row(
        children: [
          _reusableMenuItem(menuText: "All"),
          _reusableMenuItem(
            menuText: "Popular",
            color: AppColors.primaryThirdElementText,
            backgroundColor: AppColors.primaryElementText,
          ),
          _reusableMenuItem(
            menuText: "Newest",
            color: AppColors.primaryThirdElementText,
            backgroundColor: AppColors.primaryElementText,
          ),
        ],
      ),
    ],
  );
}

Widget _reusableMenuItem({
  required String menuText,
  Color color = AppColors.primaryElementText,
  Color backgroundColor = AppColors.primaryElement,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    margin: EdgeInsets.only(right: 15.w),
    decoration: BoxDecoration(
      color: backgroundColor,
      border: Border.all(color: backgroundColor),
      borderRadius: BorderRadius.circular(7.r),
    ),
    child: reusableText(
      text: menuText,
      color: color,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
  );
}

//////////////////////////////////////////////////
//course grid
Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      borderRadius: BorderRadius.circular(15.r),
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/icons/Image.png"),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best Course for cyber Security",
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: Colors.white,
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          "Flutter best course",
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: AppColors.primaryFourthElementText,
            fontSize: 8.sp,
          ),
        ),
      ],
    ),
  );
}
