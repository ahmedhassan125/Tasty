import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yumzy/core/localization/language_cubit.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../../../shared/custom_cupertino_indicator.dart';
import '../../../shared/custom_snak_bar.dart';
import '../widgets/custom_text_form_field.dart';
import '../../../shared/shared_screen/guest_screen_widget.dart';
import '../../cart/data/cart_cubit/cart_cubit.dart';
import '../../checkout/widget/payment_method_widget.dart';
import '../../home/data/hom_cubit/home_cubit.dart';
import '../../orderHistory/data/order_cubit/order_cubit.dart';
import '../data/auth_cubit/auth_cubit.dart';
import '../data/auth_cubit/auth_state.dart';
import '../widgets/custom_auth_bottom.dart';
import '../widgets/profile_screen_widgets/change_language_widget.dart';
import '../widgets/profile_screen_widgets/profile_screen_body.dart';
import '../widgets/profile_screen_widgets/profile_screen_header.dart';
import '../widgets/profile_screen_widgets/profile_screen_photo.dart';
import '../widgets/profile_screen_widgets/profile_screen_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AuthCubit.get(context);
    final LangCubit = LanguageCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        final isGust = cubit.token == null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: isGust ? Colors.white : kPrimaryColor,
            body: isGust ? GuestScreenWidget(text: S.of(context).editeProfile)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      ProfileScreenHeader(authCubit: cubit, state: state),
                      const   SizedBox(height: 30),
                      ProfileScreenBody(
                        state: state,
                        profileWidget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileScreenPhoto(authCubit: cubit,),
                            ProfileScreenWidget(widgetName: S.of(context).email,controller:  cubit.emailController ??TextEditingController() ),
                            ProfileScreenWidget(widgetName: S.of(context).name,controller:  cubit.nameController ??TextEditingController() ),
                            ProfileScreenWidget(widgetName: S.of(context).address,controller:  cubit.addressController ??TextEditingController() ),
                            const SizedBox(height: 15),
                            PaymentMethodWidget(
                              icon: Icon(Icons.edit,color: Colors.white,),
                              color: Colors.blue,
                              text: cubit.profile?.data?.visa ?? '',
                              isSelected: true,
                              imagePath: 'assets/images/visa.png',
                              onTap: () {
                                cubit.editeVisa();
                              },
                            ),
                            const SizedBox(height: 15),
                            cubit.isSelected ?
                            CustomTextFormField(
                              Controller:
                              cubit.paymentController ??
                                  TextEditingController(),

                              height: 60,
                              textInputType: TextInputType.number,
                            ): SizedBox(),
                            const SizedBox(height: 15),
                            Row(
                              textDirection: TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ChangeLanguageWidget(function: ()  { LangCubit.changeLanguage('ar');cubit.arabicLanguage;},languageName: 'عربي',selectedLanguage: LangCubit.language =='ar',),
                                ChangeLanguageWidget(function: ()  { LangCubit.changeLanguage('en');cubit.englishLanguage;},languageName: 'English',selectedLanguage: LangCubit.language =='en',),
                              ],

                            ),
                            const SizedBox(height: 15),
                            (state is UpdateProfileLoadingState)?
                            CustomCupertinoIndicator():
                            CustomProfileBottom(
                                    textColor: Colors.white,
                                    bottomText: S.of(context).updateProfile,
                                    bottomColor: kPrimaryColor,
                                    width: double.infinity,
                                    onTap: () {
                                      cubit.updateProfile(
                                        name: cubit.nameController?.text,
                                        email: cubit.emailController?.text,
                                        address: cubit.addressController?.text,
                                        visa: cubit.paymentController?.text,
                                         // image: MultipartFile.fromFile(cubit.profileImage! , filename: 'photo'),
                                      );

                                    },
                                  ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LogOutErrorState) {
          AppSnackBar.error(context, state.message);
        } else if (state is LogOutSuccessState) {
          CartCubit.get(context).restartCart();
          OrderCubit.get(context).restartOrderScreen();
          context.go('/MainRootScreen');
          HomeCubit.get(context).bottomNavChange(0);
          AppSnackBar.success(context, state.message);
        } else if (state is UpdateProfileSuccessState) {
          AppSnackBar.success(
            context, S.of(context).updateSuccessfully,
          );
        } else if (state is UpdateProfileErrorState) {
          AppSnackBar.error(context, state.message);
        }
      },
    );
  }
}
