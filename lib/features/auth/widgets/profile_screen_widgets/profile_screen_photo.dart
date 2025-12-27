import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yumzy/features/auth/data/auth_cubit/auth_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../../generated/l10n.dart';
import '../custom_auth_bottom.dart';

class ProfileScreenPhoto extends StatelessWidget {
  const ProfileScreenPhoto({super.key, required this.authCubit});
  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const  SizedBox(height: 20),
        Center(
          child: CircleAvatar(
            radius: 60,
            backgroundImage:
            //FileImage(File(authCubit.profileImage?? ''))
            
            NetworkImage(
              authCubit.profile?.data?.image ??
                  'https://icons.veryicon.com/png/o/miscellaneous/bitisland-world/person-18.png',
            ),
          ),
        ),
        const  SizedBox(height: 20),
        Center(
          child: CustomProfileBottom(
            textColor: Colors.white,
            bottomText: S.of(context).uploadPhoto,
            bottomColor: kPrimaryColor,
            width: 160,
            onTap: () {

             // authCubit.pickedProfileImage();
            },
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
