// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email Address`
  String get email {
    return Intl.message('Email Address', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Sorry, you must log in to`
  String get mustLogIn {
    return Intl.message(
      'Sorry, you must log in to',
      name: 'mustLogIn',
      desc: '',
      args: [],
    );
  }

  /// `view your shopping cart.`
  String get cartGuest {
    return Intl.message(
      'view your shopping cart.',
      name: 'cartGuest',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get OR {
    return Intl.message('OR', name: 'OR', desc: '', args: []);
  }

  /// `Please enter a valid email`
  String get emailValidator {
    return Intl.message(
      'Please enter a valid email',
      name: 'emailValidator',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordValidator {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordValidator',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get emptyEmail {
    return Intl.message(
      'Please enter your email',
      name: 'emptyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get emptyPassword {
    return Intl.message(
      'Password cannot be empty',
      name: 'emptyPassword',
      desc: '',
      args: [],
    );
  }

  /// `Log in and discover flavors made for you.`
  String get wellComeText {
    return Intl.message(
      'Log in and discover flavors made for you.',
      name: 'wellComeText',
      desc: '',
      args: [],
    );
  }

  /// `Hungry? Let’s fix that!`
  String get singUpWellCome {
    return Intl.message(
      'Hungry? Let’s fix that!',
      name: 'singUpWellCome',
      desc: '',
      args: [],
    );
  }

  /// `your name cannot by empty`
  String get emptyName {
    return Intl.message(
      'your name cannot by empty',
      name: 'emptyName',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message('name', name: 'name', desc: '', args: []);
  }

  /// `Please confirm your phone`
  String get phoneValidator {
    return Intl.message(
      'Please confirm your phone',
      name: 'phoneValidator',
      desc: '',
      args: [],
    );
  }

  /// `phone`
  String get phone {
    return Intl.message('phone', name: 'phone', desc: '', args: []);
  }

  /// `Edite Your Profile.`
  String get editeProfile {
    return Intl.message(
      'Edite Your Profile.',
      name: 'editeProfile',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message('Log Out', name: 'logOut', desc: '', args: []);
  }

  /// `Upload photo`
  String get uploadPhoto {
    return Intl.message(
      'Upload photo',
      name: 'uploadPhoto',
      desc: '',
      args: [],
    );
  }

  /// `address`
  String get address {
    return Intl.message('address', name: 'address', desc: '', args: []);
  }

  /// `Update Profile`
  String get updateProfile {
    return Intl.message(
      'Update Profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Your Profile has been updated successfully`
  String get updateSuccessfully {
    return Intl.message(
      'Your Profile has been updated successfully',
      name: 'updateSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get EGP {
    return Intl.message('EGP', name: 'EGP', desc: '', args: []);
  }

  /// `Remove`
  String get remove {
    return Intl.message('Remove', name: 'remove', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `total`
  String get total {
    return Intl.message('total', name: 'total', desc: '', args: []);
  }

  /// `Item deleted from your cart`
  String get itemDeleted {
    return Intl.message(
      'Item deleted from your cart',
      name: 'itemDeleted',
      desc: '',
      args: [],
    );
  }

  /// `YOUR TASTY Cart Is Empty !`
  String get emptyCart {
    return Intl.message(
      'YOUR TASTY Cart Is Empty !',
      name: 'emptyCart',
      desc: '',
      args: [],
    );
  }

  /// `start shopping to fill it up`
  String get startShopping {
    return Intl.message(
      'start shopping to fill it up',
      name: 'startShopping',
      desc: '',
      args: [],
    );
  }

  /// `Go shopping`
  String get goShopping {
    return Intl.message('Go shopping', name: 'goShopping', desc: '', args: []);
  }

  /// `Order summary`
  String get orderSummary {
    return Intl.message(
      'Order summary',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Taxes`
  String get taxes {
    return Intl.message('Taxes', name: 'taxes', desc: '', args: []);
  }

  /// `Order`
  String get order {
    return Intl.message('Order', name: 'order', desc: '', args: []);
  }

  /// `Delivery fees`
  String get deliveryFees {
    return Intl.message(
      'Delivery fees',
      name: 'deliveryFees',
      desc: '',
      args: [],
    );
  }

  /// `Total fees:`
  String get totalFees {
    return Intl.message('Total fees:', name: 'totalFees', desc: '', args: []);
  }

  /// `delivery time:`
  String get deliveryTime {
    return Intl.message(
      'delivery time:',
      name: 'deliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `Payment methods:`
  String get paymentMethods {
    return Intl.message(
      'Payment methods:',
      name: 'paymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `pay online`
  String get payOnline {
    return Intl.message('pay online', name: 'payOnline', desc: '', args: []);
  }

  /// `Pay now`
  String get payNaw {
    return Intl.message('Pay now', name: 'payNaw', desc: '', args: []);
  }

  /// `mins`
  String get mins {
    return Intl.message('mins', name: 'mins', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Payment has been processed. We hope to see you soon`
  String get paymentSuccess {
    return Intl.message(
      'Payment has been processed. We hope to see you soon',
      name: 'paymentSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message('Search', name: 'Search', desc: '', args: []);
  }

  /// `No Order Yet`
  String get noOrder {
    return Intl.message('No Order Yet', name: 'noOrder', desc: '', args: []);
  }

  /// `Show Your Order History.`
  String get showOrderHistory {
    return Intl.message(
      'Show Your Order History.',
      name: 'showOrderHistory',
      desc: '',
      args: [],
    );
  }

  /// `Log in and discover flavors made for you.`
  String get wellComeGuest {
    return Intl.message(
      'Log in and discover flavors made for you.',
      name: 'wellComeGuest',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `price`
  String get price {
    return Intl.message('price', name: 'price', desc: '', args: []);
  }

  /// `Re Order`
  String get reOrder {
    return Intl.message('Re Order', name: 'reOrder', desc: '', args: []);
  }

  /// `quantity`
  String get quantity {
    return Intl.message('quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Toppings`
  String get toppings {
    return Intl.message('Toppings', name: 'toppings', desc: '', args: []);
  }

  /// `Side options`
  String get sideOptions {
    return Intl.message(
      'Side options',
      name: 'sideOptions',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Customize your experience with us`
  String get spicySlider {
    return Intl.message(
      'Customize your experience with us',
      name: 'spicySlider',
      desc: '',
      args: [],
    );
  }

  /// `Spicy`
  String get spicy {
    return Intl.message('Spicy', name: 'spicy', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `history`
  String get history {
    return Intl.message('history', name: 'history', desc: '', args: []);
  }

  /// `profile`
  String get profile {
    return Intl.message('profile', name: 'profile', desc: '', args: []);
  }

  /// `Go Back`
  String get goBack {
    return Intl.message('Go Back', name: 'goBack', desc: '', args: []);
  }

  /// `You must log in to continue`
  String get mustLog {
    return Intl.message(
      'You must log in to continue',
      name: 'mustLog',
      desc: '',
      args: [],
    );
  }

  /// `USD`
  String get usd {
    return Intl.message('USD', name: 'usd', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
