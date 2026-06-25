import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/feature/auth/screens/log_in.dart';
import 'package:fitness/src/feature/auth/screens/sign_up.dart';
import 'package:fitness/src/feature/home/screens/home_screen.dart';
import 'package:fitness/src/feature/home/screens/main_screen.dart';
import 'package:fitness/src/feature/home/screens/star_screen.dart';
import 'package:fitness/src/feature/on_boarding/screens/on_boarding.dart';
import 'package:fitness/src/feature/on_boarding/screens/on_boarding_1.dart';
import 'package:fitness/src/feature/on_boarding/screens/on_boarding_2.dart';
import 'package:fitness/src/feature/on_boarding/screens/on_boarding_3.dart';
import 'package:fitness/src/feature/set_up/screens/activity_level.dart';
import 'package:fitness/src/feature/set_up/screens/gender.dart';
import 'package:fitness/src/feature/set_up/screens/goal_screen.dart';
import 'package:fitness/src/feature/set_up/screens/old.dart';
import 'package:fitness/src/feature/set_up/screens/set_up.dart';
import 'package:fitness/src/feature/set_up/screens/your_height.dart';
import 'package:fitness/src/feature/set_up/screens/your_width.dart';
import 'package:fitness/src/feature/settings/screens/detail_profil.dart';
import 'package:fitness/src/feature/settings/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.onboarding:
        return onPage(OnBoarding());
          case AppPages.onboarding1:
        return onPage(OnBoarding1());
          case AppPages.onboarding2:
        return onPage(OnBoarding2());
        case AppPages.onboarding3:
        return onPage(OnBoarding3());
case AppPages.signup:
        return onPage(SignUp());
      case AppPages.login:
        return onPage(Login());
         case AppPages.goal:
        return onPage(GoalScreen());
         case AppPages.setup:
        return onPage(SetUp());
         case AppPages.gender:
        return onPage(Gender());
         case AppPages.old:
        return onPage(Old());
         case AppPages.yourheight:
        return onPage(YourHeight());
         case AppPages.yourwidth:
        return onPage(YourWidth());
              case AppPages.level:
        return onPage(ActivityLevel());
    case AppPages.home:
        return onPage(HomeScreen());
     
           case AppPages.main:
        return onPage(MainScreen());
         case AppPages.zvezda:
        return onPage(StarScreen());
          case AppPages.pro:
        return onPage(ProfileScreen());
            case AppPages.detailpro:
        return onPage(DetailProfil());
    
 default: return null;
    }
    

  }

  static MaterialPageRoute<dynamic> onPage(Widget page) =>
      MaterialPageRoute(builder: (context) => page);
}
