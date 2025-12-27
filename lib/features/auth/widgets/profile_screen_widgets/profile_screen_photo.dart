import 'package:flutter/material.dart';
import 'package:yumzy/features/auth/data/auth_cubit/auth_cubit.dart';
import '../../../../core/constants/colors.dart';
import '../../../../generated/l10n.dart';
import '../../../../shared/user_profile_photo.dart';
import '../custom_auth_bottom.dart';

class ProfileScreenPhoto extends StatelessWidget {
  const ProfileScreenPhoto({super.key, required this.authCubit});
  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const  SizedBox(height: 20),
        Center(child:UserProfilePhoto(radius: 60,)),
        const  SizedBox(height: 20),
        Center(
          child: CustomProfileBottom(
            textColor: Colors.white,
            bottomText: S.of(context).uploadPhoto,
            bottomColor: kPrimaryColor,
            width: 160,
            onTap: () {
              authCubit.pickProfileImage();
            },
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
