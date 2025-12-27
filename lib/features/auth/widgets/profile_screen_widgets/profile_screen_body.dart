import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/auth_cubit/auth_state.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key, required this.profileWidget, required this.state});
  final Widget profileWidget;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Skeletonizer(
          enabled: state is GetProfileLoadingState,
          effect: const ShimmerEffect(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: SingleChildScrollView(
              child: profileWidget ,

            ),
          ),
        ),
      ),
    );
  }
}
