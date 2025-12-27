import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumzy/features/auth/data/auth_cubit/auth_cubit.dart';
import '../../../core/constants/colors.dart';
import '../data/hom_cubit/home_cubit.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);
    final homeCubit = HomeCubit.get(context);

    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/logo3.svg',
          colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
          width: 180,
        ),
        const Spacer(),
        CircleAvatar(
          radius: 30,
          backgroundImage: authCubit.profile?.data?.image != null
              ? NetworkImage('${authCubit.profile!.data!.image}')
              : AssetImage('assets/images/profile.png'),
          //backgroundColor: Colors.red,
        ),
      ],
    );
  }
}
