import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/route_names.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/settings.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:ulearning_app/pages/sign_up/sign_up.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';
import '../../pages/application/application_page.dart';
import '../../pages/application/bloc/app_bloc.dart';
import '../../pages/home/bloc/home_bloc.dart';
import '../../pages/home/home.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.WELCOME,
        page: const Welcome(),
        bloc: BlocProvider(create: (context) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(create: (context) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_UP,
        page: const SignUp(),
        bloc: BlocProvider(create: (context) => SignUpBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION_PAGE,
        page: const Application(),
        bloc: BlocProvider(create: (context) => AppBloc()),
      ),
      PageEntity(
        route: AppRoutes.HOME,
        page: const Home(),
        bloc: BlocProvider(create: (context) => HomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        page: const Settings(),
        bloc: BlocProvider(create: (context) => SettingsBloc()),
      ),
    ];
  }

// return all bloc providers
  static List<dynamic> allproviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];

    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where(
        (element) => element.route == settings.name,
      );
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.WELCOME && deviceFirstOpen) {
          bool isloggedin = Global.storageService.isUserLoggedIn();
          if (isloggedin) {
            return MaterialPageRoute(
                builder: (context) => const Application(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (context) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (context) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (context) => const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
