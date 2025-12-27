import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumzy/features/auth/data/auth_cubit/auth_cubit.dart';

import '../../../../core/constants/styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/auth_cubit/auth_state.dart';

class ProfileScreenHeader extends StatelessWidget {
  const ProfileScreenHeader({super.key, required this.authCubit, required this.state,});
  final AuthCubit authCubit;
  final AuthState state;



  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/logo3.svg',
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
            width: 180,
          ),
          Spacer(),
          (state is LogOutLoadingState) ? Center(
            child: CupertinoActivityIndicator(
              radius: 15,
              color: Colors.white,
            ),
          )
              : Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              border: BoxBorder.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: InkWell(
                onTap: () async => await authCubit.logOut(),
                child: Text(S.of(context).logOut,style: Styles.regularTextStyle16.copyWith(color: Colors.white),),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
