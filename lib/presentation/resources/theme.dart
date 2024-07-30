
import 'package:flutter/cupertino.dart';

abstract final class AppColors {
  static const blurBackground = Color.fromRGBO(34, 34, 34, 0.3);

  // MARK: Primary Pallet

  static const yellow = Color.fromRGBO(228, 191, 97, 1);
  static const green = Color.fromRGBO(0, 85, 75, 1);
  static const neutral = Color.fromRGBO(255, 255, 255, 1);

  // MARK: Secondary Pallet

  static const charcoal = Color.fromRGBO(50, 50, 50, 1);
  static const charcoal2 = Color.fromRGBO(161, 118, 40, 1);

  // MARK: Static colors
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const notAccent = Color.fromRGBO(157, 157, 157, 1);
  static const red = Color.fromRGBO(231, 43, 43, 1);

  // MARK: UI Elements Color
  static const blogBorderColor = Color.fromRGBO(243, 243, 243, 1);
}

abstract final class AppShadows {
  static const blogCell = BoxShadow(
    blurRadius: 22,
    color: Color.fromRGBO(0, 0, 0, 0.1),
    spreadRadius: 0,
  );

}
