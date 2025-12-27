import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumzy/features/auth/data/auth_cubit/auth_cubit.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../../../shared/custom_cupertino_indicator.dart';
import 'custom_text_form_field.dart';
import '../data/auth_cubit/auth_state.dart';
import '../screen/singup_screen.dart';
import 'custom_auth_bottom.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}
class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController emailController = TextEditingController(
    text: 'ahmed10@gmail.com',
  );
  final TextEditingController passwordController = TextEditingController(
    text: '12345678',
  );
  bool isPassword = true;
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Expanded(
        child:
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  _emailFiled(),
                  const SizedBox(height: 20),
                  _passwordFiled(),
                  const SizedBox(height: 20),
                  _logInBottom(),
                  const SizedBox(height: 20),
                  Text(S.of(context).OR, style: Styles.regularTextStyle20),
                  const  SizedBox(height: 20),
                  CustomProfileBottom(
                    bottomColor: Colors.white,
                    textColor: kPrimaryColor,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                      // context.push('/SignUpScreen');
                    },
                    bottomText: S.of(context).signUp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _emailFiled ()=>CustomTextFormField(
    textInputType: TextInputType.emailAddress,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return S.of(context).emptyEmail;
      } else if (!value.contains('@')) {
        return S.of(context).emailValidator;
      }
      return null;
    },
    hint: S.of(context).email,
    prefix: Icon(Icons.email),
    Controller: emailController,
  );
  Widget _passwordFiled ()=> CustomTextFormField(
    textInputType: TextInputType.text,
    hint: S.of(context).password,
    prefix: Icon(Icons.lock),
    Controller: passwordController,
    isPassword: isPassword,
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
    validator: (value) {
      if (value == null || value.isEmpty) {
        return S.of(context).emptyPassword;
      } else if (value.length < 8) {
        return S.of(context).passwordValidator;
      }
      return null;
    },
  );
  Widget _logInBottom (){
    var authCubit = AuthCubit.get(context);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return (state is LogInLoading)
            ? CustomCupertinoIndicator()
            : CustomProfileBottom(
          textColor: Colors.white,
          onTap: () {
            if (formKey.currentState!.validate()) {
              FocusScope.of(context).unfocus();
              authCubit.logIn(
                email: emailController.text,
                password: passwordController.text,
              );
            }
          },
          bottomText: S.of(context).login,
        );
      },
    );
  }
}
