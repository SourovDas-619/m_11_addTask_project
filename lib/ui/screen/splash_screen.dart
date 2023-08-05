import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_11_addtask_project/Data/Models/auth_utility.dart';

import 'package:m_11_addtask_project/ui/screen/LoginScreen.dart';
import 'package:m_11_addtask_project/ui/screen/bottom_nav_base_screen.dart';
import 'package:m_11_addtask_project/ui/utils/assets_utils.dart';
import 'package:m_11_addtask_project/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  Future<void> navigateToLogin() async {
    Future.delayed(Duration(seconds: 5)).then((_) async {
      final bool isLoggedIn = await AuthUtility.checkifUserLoggedin();
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    isLoggedIn ? const BottomNavBaseScreen() : const LoginScreen()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: SvgPicture.asset(
            AssetsUtils.logoSVG,
            width: 90,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
