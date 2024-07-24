import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fund_tool_app/app/base_remote_source.dart';
import 'package:fund_tool_app/app/network/dio_provider.dart';
import 'package:fund_tool_app/core/models/login_response_wrapper.dart';
import 'package:fund_tool_app/core/values/app_colors.dart';
import 'package:fund_tool_app/core/values/app_values.dart';
import 'package:fund_tool_app/data/secure_storage/secure_storage.dart';
import 'package:fund_tool_app/modules/generic_reponse_wrapper.dart';
import 'package:fund_tool_app/modules/home_screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode numberFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool? isPassSelected;
  bool isPassVisible = true;
  TextEditingController phoneController = TextEditingController(
      // text: "9876543212",
      );
  TextEditingController passController = TextEditingController(
      // text: "123456",
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  "assets/images/splash.png",
                  height: 1.sh,
                  width: 1.sw,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 1.sh,
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/logo.png",
                            height: 55.h,
                            // width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 1.sh,
                        child: Container(
                          alignment: Alignment.center,
                          width: 1.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.r),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Login",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.sp,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Please login your account.",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16.sp,
                                        color: AppColors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  Material(
                                    elevation: 1,
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Container(
                                      padding: EdgeInsets.all(1.r),
                                      decoration: isPassSelected == false
                                          ? BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              gradient: AppColors.appdGradient,
                                            )
                                          : BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              color: Colors.white,
                                              // border: Border.all(color: AppColors.grey),
                                            ),
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          color: Colors.white,
                                          // border: Border.all(color: AppColors.grey),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "+1",
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 16.sp,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Image.asset(
                                              "assets/images/arrow.png",
                                              height: 24.h,
                                              width: 24.h,
                                            ),
                                            SizedBox(
                                              width: 16.w,
                                            ),
                                            Expanded(
                                              child: TextFormField(
                                                onTap: () {
                                                  setState(() {
                                                    isPassSelected = false;
                                                  });
                                                },
                                                focusNode: numberFocusNode,
                                                controller: phoneController,
                                                keyboardType:
                                                    TextInputType.phone,
                                                inputFormatters: <TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                decoration:
                                                    InputDecoration.collapsed(
                                                  hintText: "Phone number",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 15.sp,
                                                      color: AppColors.grey
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Image.asset(
                                              "assets/images/mobile.png",
                                              height: 24.h,
                                              width: 24.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Material(
                                    elevation: 1,
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Container(
                                      padding: EdgeInsets.all(1.r),
                                      decoration: isPassSelected == true
                                          ? BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              gradient: AppColors.appdGradient,
                                            )
                                          : BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              color: Colors.white,
                                            ),
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          color: Colors.white,
                                          // border: Border.all(color: AppColors.grey),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                onTap: () {
                                                  setState(() {
                                                    isPassSelected = true;
                                                  });
                                                },
                                                focusNode: passwordFocusNode,
                                                obscureText: isPassVisible,
                                                controller: passController,
                                                keyboardType: TextInputType
                                                    .visiblePassword,
                                                decoration:
                                                    InputDecoration.collapsed(
                                                  hintText: "Password",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 15.sp,
                                                      color: AppColors.grey
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isPassVisible =
                                                      !isPassVisible;
                                                });
                                              },
                                              child: Image.asset(
                                                "assets/images/eye.png",
                                                height: 24.h,
                                                width: 24.h,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    "Forgot Password?",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: AppColors.black2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 26.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      onSubmit();
                                    },
                                    child: Material(
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                      elevation: 2,
                                      child: Container(
                                        padding: EdgeInsets.all(16.r),
                                        alignment: Alignment.center,
                                        width: 1.sw,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.r),
                                          gradient: AppColors.appdGradient,
                                        ),
                                        child: Text(
                                          "Login",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Didn’t get any account ? ',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15.sp,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Sign Up',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15.sp,
                                              color: AppColors.blue3,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          isLoading
              ? Center(
                  child: Container(
                    height: 1.sh,
                    width: 1.sw,
                    color: Colors.white,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  final snackBar = SnackBar(
    content: const Text('Please enter phone number'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  final snackBar2 = SnackBar(
    content: const Text('Please enter password'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  final snackBar3 = SnackBar(
    content: const Text('Invalid login'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  onSubmit() async {
    if (phoneController.text.trim().isEmpty) {
      //show error message
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (passController.text.trim().isEmpty) {
      //show error message
      ScaffoldMessenger.of(context).showSnackBar(snackBar2);
    } else {
      // success
      callLoginApi(context);
    }
  }

  var isLoading = false;

  Dio get dioClient => DioProvider.dioWithHeaderToken;

  Future<LoginResponseWrapper> tripAidLogin(Map data) {
    var endpoint = "${DioProvider.baseUrl}api/V1/login";
    var dioCall =
        dioClient.post(endpoint, data: Map<String, dynamic>.from(data));

    try {
      return callApiWithErrorParser(dioCall).then((response) {
        debugPrint("*********************");
        return LoginResponseWrapper.fromJson(response.data);
      });
    } catch (e) {
      debugPrint("<<<<<<<<<<<<<<<<<<<<<<<<<");
      rethrow;
    }
  }

  Future<void> callLoginApi(context) async {
    var data = {};
    isLoading = true;

    data['country_code'] = "+91";
    data['mobile'] = phoneController.text.trim();
    data['password'] = passController.text.trim();

    data['device_type'] = "android";
    data['device_id'] = "wdcxc323ec2cevrfes";
    try {
      var response = await tripAidLogin(data);
      // print("__________________${response.data?.token}");
      if (response.status == 200) {
        await SecureStorage.writeSecureData(
            key: AppValues.IS_LOGGED_IN, value: "1");
        await SecureStorage.writeSecureData(
            key: AppValues.API_TOKEN, value: response.data?.token ?? "");

        await SecureStorage.writeSecureData(
            key: AppValues.USER_DATA, value: jsonEncode(response.data));

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar3);
      }
      isLoading = false;
      setState(() {});
    } catch (e, s) {
      isLoading = false;
      print("$e, $s");
      setState(() {});
    }
  }

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;
      return response;
    } on DioException catch (dioError, s) {
      if (kDebugMode) {
        print("111 ${dioError.message}");
        print("111 ${dioError.stackTrace}");
        print(s);
      }
      try {
        var res = GenericReponseWrapper.fromJson(dioError.response?.data);
        throw BaseException(message: res.message ?? "");
      } catch (error, s) {
        print("222");
        print(s);
        if (error is BaseException) {
          rethrow;
        } else {
          throw BaseException(message: "");
        }
      }
    } catch (error, s) {
      throw BaseException(message: "");
    }
  }
}
