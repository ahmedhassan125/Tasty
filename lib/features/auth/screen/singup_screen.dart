import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumzy/features/auth/data/auth_cubit/auth_state.dart';
import 'package:yumzy/shared/custom_snak_bar.dart';
import '../../../generated/l10n.dart';
import '../../cart/data/cart_cubit/cart_cubit.dart';
import '../../home/data/hom_cubit/home_cubit.dart';
import '../../orderHistory/data/order_cubit/order_cubit.dart';
import '../data/auth_cubit/auth_cubit.dart';
import '../widgets/singup_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          HomeCubit.get(context).bottomNavChange(0);
          context.go('/MainRootScreen');
          authCubit.getProfileData();
          AppSnackBar.success(context, '{${S.of(context).welcome} ${state.user.data!.name}');
        CartCubit.get(context).getCart();
        OrderCubit.get(context).getOrderHistory();

        }
        if (state is RegisterErrorState) {
          AppSnackBar.error(context, state.error);
        }
      },

      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              SvgPicture.asset('assets/images/logo3.svg'),
              const SizedBox(height: 10),
              Text(
                S.of(context).singUpWellCome,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 40),
              SingUpWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
