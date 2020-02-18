import 'package:flutter/material.dart';

class AppColors {



  static const Color primaryColor = Color(0xFF260082);
  static const Color primaryLightColor = Color(0xFF3300AF);

  static const Color purpleLight = Color.fromRGBO(38, 0, 130, 0.1);
  static const Color indigo = Color.fromRGBO(41, 38, 110, 0.9);

  static const Color lightGrey = Color(0xFFF4F6F8);

  static const Color disableGrey = Color(0xFFE9EBED);
  static const Color grey = Color(0xFF4E5D6B);

  static const Color iconsColor = Color(0xFFC3CBD2);

  static const Color pink = Color.fromRGBO(255, 67, 90, 1);

  static const Color amountColor = Color.fromARGB(255, 195, 203, 210);


  static const Color error = Color(0xFFFF435A);
  static const Color backgroundInputFocus = Color.fromRGBO(38, 0, 130, 0.04);
  static const Color backgroundInputError = Color.fromRGBO(255, 67, 90, 0.03);
  static const Color labelInputFocus = Color.fromRGBO(51, 0, 175, 0.35);



  /*OnBoarding*/
  static const Color textColorYellow = Color(0xFFFFC71B);

  /*Widgets*/
  static const Color inputTextBorderColor = Color(0xFFECEBEB);
  static const Color inputTextColor = Color(0xFF979797);
  static const Color primaryTextColor = Color(0xFF616F96);

  /*Create Badge*/
  static const Color textColorPurple = Color(0xFF4F5F8E);

  /*Badge Location Details Screen (Map Screen)*/
  static const Color textColorGrey = Color(0xFF666666);

  /*Send Invitation Toggle Button unselected*/
  static const Color toggleUnselectedColor = Color(0xFFEDEFF4);

  /*History Screen CheckedOut text color*/
  static const Color textColorCheckedOut = Color(0xFF323232);

  /*Tickets Status Colors*/
  static const Color ticketStatusClosedColor = Color(0xFF536EDA);
  static const Color ticketStatusOpenColor = Color(0xFFFFC71B);
  static const Color ticketStatusInProgressColor = Color(0xFF3FBA91);

  /*Other colors*/

  static const Color redErrorColor = Color(0xFFF7622E);
  static const Color cardYellowColor = Color(0xFFFFC71B);
  static const Color cardBlueColor = Color(0xFF5E76FA);
  static const Color cardRedColor = Color(0xFFF7622E);
  static const Color cardGreenColor = Color(0xFF75A247);
  static const Color cardOrangeColor = Color(0xFFFF8F01);

  static const Color cardStatusGrantedColor = Color(0xFF8EC253);
  static const Color cardStatusRejectedColor = Color(0xFFEB4434);
  static const Color cardStatusPendingColor = Color(0xFF666666);

  static const Color accentColor = Color(0xFF607D8B);
  static const Color dividerColor = Color(0xFFBDBDBD);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color textColor = Color(0xFFFFFFFF);

//  static const Color primaryTextColor = Color(0xFF212121);
  static const Color secondaryTextColor = Color(0xFF757575);

  static const Color lightBackgroundColor = Color(0xFFFFFFFF);

  static const Color onboardingBackgroundColor1 = Color(0xFF3FBA91);
  static const Color onboardingBackgroundColor2 = Color(0xFF198DE0);
  static const Color onboardingBackgroundColor3 = Color(0xFFFDAC51);
  static const Color onboardingBackgroundColor4 = Color(0xFFF2806F);

  static const Color cardBluePrimary = Color(0xFF00AAEC);
  static const Color cardBlueDark = Color(0xFF008FC4);
  static const Color cardGreenPrimary = Color(0xFF8EC253);
  static const Color cardGreenDark = Color(0xFF75A247);
  static const Color cardGreyPrimary = Color(0xFF666666);
  static const Color cardGreyDark = Color(0xFF545454);
  static const Color cardRedPrimary = Color(0xFFEB4434);
  static const Color cardRedDark = Color(0xFFC73A29);
  static const Color cardBlackPrimary = Color(0xFF262626);
  static const Color cardBlackDark = Color(0xFF343434);

  static const Color ticketCommentCircleGreen = Color(0xFF00A466);

  static List<Color> getCardColors() {
    return [
      cardYellowColor,
      cardBlueColor,
      cardRedColor,
      cardGreenColor,
      cardOrangeColor
    ];
  }
}
