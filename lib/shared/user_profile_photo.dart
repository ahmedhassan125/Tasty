import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../features/auth/data/auth_cubit/auth_cubit.dart';
import 'custom_cupertino_indicator.dart';

class UserProfilePhoto extends StatelessWidget {
  const UserProfilePhoto({super.key, required this.radius});
  final double radius;

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);

    return CachedNetworkImage(
      imageUrl: authCubit.profile?.data?.image ?? "",
      placeholder: (context, url) => CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey[200],
        child: CustomCupertinoIndicator(),
      ),
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: radius,
        backgroundImage:
        authCubit.pickedImage != null
            ? FileImage(authCubit.pickedImage!)
            : imageProvider,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );;
  }
}
