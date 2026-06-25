import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/feature/home/screens/home_screen.dart';
import 'package:fitness/src/feature/home/screens/list_screen.dart';
import 'package:fitness/src/feature/home/screens/star_screen.dart';
import 'package:fitness/src/feature/settings/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> pages = [HomeScreen(), ListScreen(),StarScreen(),ProfileScreen()];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        
        backgroundColor: AppColors.primary,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
       
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors.primary,
            label: '',
            icon:SvgPicture.asset('assets/icons/home.svg')
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset('assets/icons/list.svg')
          ),
          BottomNavigationBarItem(
            label: '',
            icon:SvgPicture.asset('assets/icons/star.svg', color: AppColors.white,)
          ),
 BottomNavigationBarItem(
            label: '',
            icon:SvgPicture.asset('assets/icons/settings.svg')
           
          ),


         
        ],
      ),);
}
}
