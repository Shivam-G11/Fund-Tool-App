// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '/app/core/values/app_colors.dart';
//
// const centerTextStyle = TextStyle(
//   fontSize: 28,
//   fontWeight: FontWeight.bold,
//   color: AppColors.centerTextColor,
// );
//
// const errorTextStyle = TextStyle(
//   fontSize: 12,
//   fontWeight: FontWeight.w400,
//   color: AppColors.errorColor,
// );
//
// const greyDarkTextStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textColorGreyDark, height: 1.45);
//
// const primaryColorSubtitleStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.colorPrimary, height: 1.45);
//
// const whiteText16 = TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.w400,
//   color: Colors.white,
// );
//
// const whiteText18 = TextStyle(
//   fontSize: 18,
//   fontWeight: FontWeight.w400,
//   color: Colors.white,
// );
//
// const whiteText32 = TextStyle(
//   fontSize: 32,
//   fontWeight: FontWeight.w400,
//   color: Colors.white,
// );
//
// const cyanText16 = TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.w400,
//   color: AppColors.textColorCyan,
// );
//
// const cyanText32 = TextStyle(
//   fontSize: 32,
//   fontWeight: FontWeight.w400,
//   color: AppColors.textColorCyan,
// );
//
// const dialogSubtitle = TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.w400,
//   color: AppColors.textColorPrimary,
// );
//
// const labelStyle = TextStyle(
//   fontSize: 18,
//   fontWeight: FontWeight.w400,
//   height: 1.8,
// );
//
// final labelStylePrimaryTextColor = labelStyle.copyWith(
//   color: AppColors.textColorPrimary,
//   height: 1,
// );
//
// final labelStyleAppPrimaryColor = labelStyle.copyWith(
//   color: AppColors.colorPrimary,
//   height: 1,
// );
//
// final labelStyleGrey = labelStyle.copyWith(color: const Color(0xFF323232).withOpacity(0.5));
//
// final labelCyanStyle = labelStyle.copyWith(color: AppColors.textColorCyan);
//
// const labelStyleWhite = TextStyle(
//   fontSize: 18,
//   fontWeight: FontWeight.w400,
//   height: 1.8,
//   color: Colors.white,
// );
//
// const appBarSubtitleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.25, color: AppColors.colorWhite);
//
// const cardTitleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.textColorPrimary);
//
// const cardTitleCyanStyle = TextStyle(
//   fontSize: 20,
//   fontWeight: FontWeight.w500,
//   color: AppColors.colorPrimary,
// );
//
// const cardSubtitleStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.textColorGreyLight);
//
// const titleStyle = TextStyle(
//   fontSize: 18,
//   fontWeight: FontWeight.w500,
//   height: 1.34,
// );
//
// const settingsItemStyle = TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.w400,
// );
//
// const buttonTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white);
//
// final cardTagStyle = titleStyle.copyWith(color: AppColors.textColorGreyDark);
//
// const titleStyleWhite = TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.colorWhite);
//
// const inputFieldLabelStyle = TextStyle(
//   fontSize: 18,
//   fontWeight: FontWeight.w500,
//   height: 1.34,
//   color: AppColors.textColorPrimary,
// );
//
// const cardSmallTagStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.textColorGreyDark);
//
// const pageTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.15, color: AppColors.appBarTextColor);
//
// final pageTitleBlackStyle = pageTitleStyle.copyWith(color: AppColors.textColorPrimary);
//
// const appBarActionTextStyle = TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.w600,
//   color: AppColors.colorPrimary,
// );
//
// const pageTitleWhiteStyle = TextStyle(fontSize: 28, fontWeight: FontWeight.w600, height: 1.15, color: AppColors.colorWhite);
//
// const extraBigTitleStyle = TextStyle(
//   fontSize: 40,
//   fontWeight: FontWeight.w600,
//   height: 1.12,
// );
//
// final extraBigTitleCyanStyle = extraBigTitleStyle.copyWith(color: AppColors.textColorCyan);
//
// const bigTitleStyle = TextStyle(
//   fontSize: 28,
//   fontWeight: FontWeight.w700,
//   height: 1.15,
// );
//
// const mediumTitleStyle = TextStyle(
//   fontSize: 24,
//   fontWeight: FontWeight.w500,
//   height: 1.15,
// );
//
// const descriptionTextStyle = TextStyle(
//   fontSize: 16,
// );
//
// final bigTitleCyanStyle = bigTitleStyle.copyWith(color: AppColors.textColorCyan);
//
// const bigTitleWhiteStyle = TextStyle(
//   fontSize: 28,
//   fontWeight: FontWeight.w700,
//   height: 1.15,
//   color: Colors.white,
// );
//
// const boldTitleStyle = TextStyle(
//   fontSize: 18,
//   fontWeight: FontWeight.w700,
//   height: 1.34,
// );
// final boldTitleWhiteStyle = boldTitleStyle.copyWith(color: AppColors.textColorWhite);
//
// final boldTitleCyanStyle = boldTitleStyle.copyWith(color: AppColors.textColorCyan);
//
// final boldTitleSecondaryColorStyle = boldTitleStyle.copyWith(color: AppColors.textColorSecondary);
//
// final boldTitlePrimaryColorStyle = boldTitleStyle.copyWith(color: AppColors.colorPrimary);
//
// TextStyle headline1 = TextStyle(
//   // fontSize: 16.sp,
//   fontFamily: "Montserrat-EB",
//   // color: ,
// );
//
// final headline2 = TextStyle(
//   fontSize: 8.sp,
//   fontFamily: "Montserrat-B",
//   color: AppColors.white,
// );
// TextStyle headline3 = TextStyle(
//   fontSize: 11.sp,
//   fontFamily: "Montserrat-R",
//   color: AppColors.textRegular,
// );
// TextStyle headline4 = TextStyle(
//   fontSize: 10.sp,
//   fontFamily: "Montserrat-M",
//   color: AppColors.darkBlack,
// );
// TextStyle headline5 = TextStyle(
//   fontSize: 14.sp,
//   fontFamily: "Montserrat-SB",
//   color: AppColors.darkBlack,
// );
//
// TextStyle notoSansBold = TextStyle(
//   fontSize: 14.sp,
//   fontFamily: "Poppins-B",
//   color: AppColors.black,
// );
//
// TextStyle notoSansLight = TextStyle(
//   fontSize: 14.sp,
//   fontFamily: "NotoSans-L",
//   color: AppColors.black,
// );
//
// TextStyle notoSansMedium = TextStyle(
//   fontSize: 14.sp,
//   fontFamily: "NotoSans-M",
//   color: AppColors.black,
// );
//
// TextStyle notoSansRegular = TextStyle(
//   fontSize: 14.sp,
//   fontFamily: "NotoSans-R",
//   color: AppColors.black,
// );
//
// TextStyle notoSansSemiBold = TextStyle(
//   fontSize: 14.sp,
//   fontFamily: "NotoSans-SB",
//   color: AppColors.black,
// );
//
// TextStyle geometos = TextStyle(
//   fontFamily: "Geometos",
// );
//
// TextStyle archivoBold = TextStyle(
//   fontFamily: "Geometos",
// );
//
// TextStyle archivoMedium = TextStyle(
//   fontFamily: "Archivo-M",
// );
//
// TextStyle archivoRegular = TextStyle(
//   fontFamily: "Archivo-R",
// );
//
// TextStyle archivoSemiBold = TextStyle(
//   fontFamily: "Archivo-SB",
// );
//
// TextStyle popinsBold = TextStyle(
//   fontSize: 14.sp,
//   fontFamily: "Poppins-B",
//   color: AppColors.black,
// );
//
// TextStyle popinsExtraBold = TextStyle(
//   fontSize: 14.sp,
//   fontFamily: "Poppins-EB",
//   color: AppColors.black,
// );
//
// TextStyle popinsLight = TextStyle(
//   fontSize: 14.sp,
//   fontFamily: "Poppins-L",
//   color: AppColors.black,
// );
//
// TextStyle popinsMedium = TextStyle(
//   fontSize: 14.sp,
//   fontFamily: "Poppins-M",
//   color: AppColors.black,
// );
//
// TextStyle popinsRegular = TextStyle(
//   fontSize: 14.sp,
//   fontFamily: "Poppins-R",
//   color: AppColors.black,
// );
//
// TextStyle popinsSemiBold = TextStyle(
//   fontSize: 14.sp,
//   fontFamily: "Poppins-SB",
//   color: AppColors.black,
// );
