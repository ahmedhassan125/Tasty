import 'package:flutter/material.dart';

import 'colors.dart';

abstract class Styles {
  static const boldTextStyle20 = TextStyle(fontSize: 20, fontWeight: FontWeight.bold,);
  static const boldTextStyle16 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold,);
  static const boldTextStyle18 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold,);
  static const regularTextStyle14 = TextStyle(fontSize: 14);
  static const regularTextStyle16 = TextStyle(fontSize: 16);
  static const regularTextStyle18 = TextStyle(fontSize: 18,color: Color(0xff6A6A6A));
  static const gryRegularTextStyle18 = TextStyle(fontSize: 18,color: Color(0xff7D7D7D));
  static const gryRegularTextStyle14 = TextStyle(fontSize: 14,color: Color(0xff7D7D7D));
  static const regularTextStyle20 = TextStyle(fontSize: 20);
  static const regularTextStyle30 = TextStyle(fontSize: 30);
  static const cardItemTitle = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff3C2F2F), overflow: TextOverflow.ellipsis,);
  static const cardDetailsTitle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff3C2F2F), overflow: TextOverflow.ellipsis,);
  static const regularTextStyle20WithColor = TextStyle(color: kPrimaryColor,fontSize: 18);
  static const regularTextStyle20white = TextStyle(fontSize: 20,color: Colors.white);

}
