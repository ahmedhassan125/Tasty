import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../../../shared/custom_cupertino_indicator.dart';
import 'custom_text_form_field.dart';
import '../data/auth_cubit/auth_cubit.dart';
import '../data/auth_cubit/auth_state.dart';
import 'custom_auth_bottom.dart';

class SingUpWidget extends StatefulWidget {
  const SingUpWidget({super.key});

  @override
  State<SingUpWidget> createState() => _SingUpWidgetState();
}

class _SingUpWidgetState extends State<SingUpWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isPassword = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);

    return  Form(
      key: formKey,
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                 const SizedBox(height: 40),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).emptyName;
                      } else {
                        return null;
                      }
                    },
                    Controller: nameController,
                    hint: S.of(context).name,
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).emptyEmail;
                      } else if (!value.contains('@')) {
                        return S.of(context).emailValidator;
                      }
                      return null;
                    },
                    Controller: emailController,
                    hint: S.of(context).email,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    isPassword: isPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).emptyPassword;
                      } else if (value.length < 8) {
                        return S.of(context).passwordValidator;
                      } else {
                        return null;
                      }
                    },
                    Controller: passwordController,
                    hint: S.of(context).password,
                    textInputType: TextInputType.visiblePassword,
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: isPassword
                          ? Icon(Icons.remove_red_eye_outlined)
                          : Icon(Icons.remove_red_eye_rounded),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.length < 11) {
                        return S.of(context).phoneValidator;
                      } else {
                        return null;
                      }
                    },
                    Controller: phoneController,
                    hint:  S.of(context).phone,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<AuthCubit , AuthState>(builder: (context, state) {
                    return  (state is RegisterLoadingState)
                        ? CustomCupertinoIndicator()
                        : CustomProfileBottom(
                      textColor: Colors.white,
                      bottomText: S.of(context).signUp,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          cubit.register(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                    );
                  },),
                  const SizedBox(height: 10),
                  Text(S.of(context).OR, style: Styles.regularTextStyle20),
                  const SizedBox(height: 10),
                  CustomProfileBottom(
                    bottomColor: Colors.white,
                    textColor: kPrimaryColor,
                    onTap: ()=> context.go('/LogInScreen'),
                    bottomText: S.of(context).login,
                  ),
                  const SizedBox(height: 10),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
