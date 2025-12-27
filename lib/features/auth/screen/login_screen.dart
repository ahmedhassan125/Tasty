import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumzy/features/auth/data/auth_cubit/auth_state.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../../../shared/custom_snak_bar.dart';
import '../../cart/data/cart_cubit/cart_cubit.dart';
import '../../home/data/hom_cubit/home_cubit.dart';
import '../../orderHistory/data/order_cubit/order_cubit.dart';
import '../data/auth_cubit/auth_cubit.dart';
import '../widgets/login_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = CartCubit.get(context);
    final orderCubit = OrderCubit.get(context);
    final authCubit = AuthCubit.get(context);
    final homeCubit = HomeCubit.get(context);
    final screenHeight = MediaQuery.of(context).size.height * 0.1;
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is LogInSuccess || current is LogInError,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight),
              SvgPicture.asset('assets/images/logo3.svg'),
              const SizedBox(height: 10),
              Text(
                S.of(context).wellComeText,                textAlign: TextAlign.center,
                style: Styles.regularTextStyle14.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 40),
              LoginWidget(),
            ],
          ),
        ),
      ),
      listener: (context, state)  {
        if (state is LogInSuccess) {
          AppSnackBar.success(context, '${S.of(context).welcome} ${state.user.name}');
          homeCubit.bottomNavChange(0);
          context.go('/MainRootScreen');
          authCubit.getProfileData();
          cartCubit.getCart();
          orderCubit.getOrderHistory();
        } else if (state is LogInError) {
          AppSnackBar.error(context, state.message);
        }
      },
    );
  }
}
