import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yumzy/core/localization/language_cubit.dart';
import 'package:yumzy/shared/app_router.dart';
import 'core/bloc_observer.dart';
import 'core/constants/colors.dart';
import 'core/localization/language_state.dart';
import 'core/network/dio_helper.dart';
import 'core/network/secure_storege_helper.dart';
import 'core/network/shared_pref_helper.dart';
import 'core/remot_config_service.dart';
import 'features/auth/data/auth_cubit/auth_cubit.dart';
import 'features/cart/data/cart_cubit/cart_cubit.dart';
import 'features/home/data/hom_cubit/home_cubit.dart';
import 'features/orderHistory/data/order_cubit/order_cubit.dart';
import 'generated/l10n.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  final dioHelper = DioHelper(Dio());
  await dioHelper.init();
  final initialToken = await SecureStorageHelper.getToken();
  await Firebase.initializeApp();
  await RemoteConfigService.setupRemoteConfig();
  Bloc.observer = CrashlyticsBlocObserver();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };


  runApp( MyApp(dioHelper : dioHelper,initialToken: initialToken));
}

class MyApp extends StatelessWidget {
  final DioHelper dioHelper;
  final String? initialToken;


   MyApp({super.key, required this.dioHelper,this.initialToken});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(dioHelper)..checkAuthState(initialToken)),
        BlocProvider(create: (context) => HomeCubit(dioHelper)..getCategory()..getProducts()),
        BlocProvider(create: (context) => CartCubit(dioHelper)..getTopping()..getSideOption()),
        BlocProvider(create: (context) => OrderCubit(dioHelper)),
        BlocProvider(create: (context) => LanguageCubit()),
      ],
      child: BlocBuilder<LanguageCubit , LanguageState>(builder: (context, state) {
        Locale currentLocale = const Locale('en');
        if (state is LanguageInitialState) currentLocale = state.locale;
        if (state is LanguageChanged) currentLocale = state.locale;
        return MaterialApp.router(
          routerConfig: appRouter,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          locale:currentLocale,
          //Locale('ar'),
         // currentLocale.
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: kPrimaryColor,
          ),
          //  home: LogInScreen(),
        );
      })

    );
  }
}
