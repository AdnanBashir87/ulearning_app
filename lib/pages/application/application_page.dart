import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/widgets/application_widgets.dart';

import 'bloc/app_bloc.dart';
import 'bloc/app_event.dart';
import 'bloc/app_state.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: AppColors.primaryBackground,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.primaryBackground,
              body: buildPages(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      // offset: Offset(0, 1),
                      blurRadius: 1,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: BottomNavigationBar(
                  currentIndex: state.index,
                  elevation: 0,
                  backgroundColor: AppColors.primaryBackground,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  onTap: (value) {
                    context.read<AppBloc>().add(TriggerAppEvent(value));
                  },
                  items: bottomTabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
