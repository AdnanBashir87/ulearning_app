import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/home/bloc/home_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_event.dart';

import '../../common/entities/user.dart';

// class HomeController {
//   late final BuildContext context;
//
//   UserItem userProfile = Global.storageService.getUserProfile();
//
//   HomeController({required this.context});
//
//   Future<void> init() async {
//     if (Global.storageService.getUserToken().isNotEmpty) {
//       // var result = await CourseAPI.courseList();
//       // if (result.code == 200) {
//       //   context.read<HomeBloc>().add(CourseItems(result.data));
//       // }
//     }
//   }
// }
