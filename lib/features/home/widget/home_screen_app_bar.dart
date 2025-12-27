import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumzy/features/auth/data/auth_cubit/auth_cubit.dart';
import 'package:yumzy/features/auth/data/auth_cubit/auth_state.dart';
import 'package:yumzy/features/home/data/hom_cubit/home_cubit.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/user_profile_photo.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {

final homeCubit = HomeCubit.get(context);
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/logo3.svg',
          colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
          width: 180,
        ),
        const Spacer(),
        BlocBuilder<AuthCubit ,AuthState>(builder: (context, state) {
          return GestureDetector(
              onTap: (){
                homeCubit.bottomNavChange(3);
                context.go('/MainRootScreen');
              },
              child: UserProfilePhoto(radius: 30,));
        },)
      ],
    );
  }
}
