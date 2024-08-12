import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/common_widgets.dart';
import '../../../../common/values/colors.dart';

AppBar buildSettingsAppBar() {
  return AppBar(
    centerTitle: true,
    title: reusableText("Settings"),
  );
}

Widget logOut(BuildContext context, void Function()? onPressed) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to log out? "),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: onPressed,
              child: const Text("Confirm"),
            )
          ],
        ),
      );
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/icons/Logout.png"),
        ),
      ),
    ),
  );
}
