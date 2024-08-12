import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/home/home_controller.dart';
import 'package:ulearning_app/pages/home/widgets/home_widgets.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late HomeController _homeController;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _homeController = HomeController(context: context);
  //   _homeController.init();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Container(
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: homePageText(
                    color: AppColors.primaryThirdElementText, text: "Hello,"),
              ),
              SliverToBoxAdapter(
                child: homePageText(
                    top: 5, color: AppColors.primaryText, text: "Adnan Bashir"),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 20.h)),
              SliverToBoxAdapter(
                child: searchView(
                  onChanged: (p0) {},
                  onTap: () {},
                ),
              ),
              SliverToBoxAdapter(
                child: slidersView(context, state),
              ),
              SliverToBoxAdapter(
                child: mainMenu(),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.6,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: 4,
                    (context, index) {
                      return GestureDetector(
                        onTap: () {
                          //  TODO write the relative function here
                        },
                        child: courseGrid(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
