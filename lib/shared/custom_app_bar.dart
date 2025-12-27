import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar({required BuildContext context}) {
  return AppBar(
    toolbarHeight: 40,
    backgroundColor: Colors.white,
    scrolledUnderElevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    ),
  );
}
