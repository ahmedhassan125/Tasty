import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumzy/core/constants/styles.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
   //  context.go('/LogInScreen');
     context.go('/MainRootScreen');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 250),
          SvgPicture.asset('assets/images/logo3.svg'),
          Text(
            'Hungry?... Let’s fix that! ',
            style: Styles.regularTextStyle20.copyWith(color: Colors.white),
          ),
          Spacer(),
          Image(image: AssetImage('assets/images/splash.png')),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
