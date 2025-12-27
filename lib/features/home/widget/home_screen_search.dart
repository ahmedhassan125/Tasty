import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumzy/features/home/data/hom_cubit/home_cubit.dart';

import '../../../generated/l10n.dart';

class HomeScreenSearchBar extends StatelessWidget {
  const HomeScreenSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = HomeCubit.get(context);
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),

      child: TextField(
        onChanged: (value) {
          homeCubit.search(value: value);
          if (value.isEmpty) {
            homeCubit.isSelected = false;
          } else {
            homeCubit.isSelected = true;
          }
        },
        controller: homeCubit.searchController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Iconsax.search_status_14, color: Colors.black),
          hintText: S.of(context).Search,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
