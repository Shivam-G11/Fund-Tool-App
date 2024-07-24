import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fund_tool_app/app/base_remote_source.dart';
import 'package:fund_tool_app/app/network/dio_provider.dart';
import 'package:fund_tool_app/core/models/home_response_wrapper.dart';
import 'package:fund_tool_app/core/values/app_colors.dart';
import 'package:fund_tool_app/core/values/app_values.dart';
import 'package:fund_tool_app/data/secure_storage/secure_storage.dart';
import 'package:fund_tool_app/modules/generic_reponse_wrapper.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCreatedSelected = true;
  List<MyFund> myFund = [];
  List<MyFund> joinedFund = [];
  var isLoading = false;
  Data? homeData;

  Future<void> _fetchData() async {
    isLoading = true;
    setState(() {});
    var response = await getHomeDataApi();

    // print("_______________${response.data}");
    await SecureStorage.writeSecureData(
        key: AppValues.HOME_DATA, value: jsonEncode(response.data));
    homeData = response.data;
    setState(() {
      myFund = homeData?.myFund ?? [];
      joinedFund = homeData?.joinedFund ?? [];
    });
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      homeData = Data.fromJson(
          jsonDecode(await SecureStorage.readSecureData(AppValues.HOME_DATA)));
    } catch (e, s) {
      print(e.toString());
      print(s.toString());
    }
    setState(() {});
    if (homeData == null) {
      print('1111111111111111');
      _fetchData();
    } else {
      print('222222222222222222');
      setState(() {
        myFund = homeData?.myFund ?? [];
        joinedFund = homeData?.joinedFund ?? [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      height: 65.h,
                      "assets/images/splash.png",
                      width: 1.sw,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox.shrink(),
                        Image.asset(
                          "assets/images/logo.png",
                          height: 31.h,
                        ),
                        Image.asset(
                          "assets/images/noti.png",
                          height: 24.h,
                          width: 24.h,
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 22.h,
                          ),
                          Image.asset(
                            "assets/images/bg1.png",
                            height: 172.h,
                            width: 1.sw,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Image.asset(
                            "assets/images/bg2.png",
                            height: 72.h,
                            width: 1.sw,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Top Fundraisers",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                "View All",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp,
                                    color: AppColors.blue4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Container(
                            padding: EdgeInsets.all(3.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isCreatedSelected = true;
                                      });
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      alignment: Alignment.center,
                                      decoration: isCreatedSelected
                                          ? BoxDecoration(
                                              gradient: AppColors.appdGradient2,
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            )
                                          : BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                      child: Text(
                                        "Created by me",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.sp,
                                            color: isCreatedSelected
                                                ? Colors.white
                                                : Colors.black.withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isCreatedSelected = false;
                                      });
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      alignment: Alignment.center,
                                      decoration: isCreatedSelected == false
                                          ? BoxDecoration(
                                              gradient: AppColors.appdGradient2,
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            )
                                          : BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                      child: Text(
                                        "Joined by me",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.sp,
                                            color: isCreatedSelected == false
                                                ? Colors.white
                                                : Colors.black.withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          isCreatedSelected
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: myFund.length,
                                  itemBuilder: (context, index) {
                                    var data = myFund[index];
                                    return Column(
                                      children: [
                                        Material(
                                          elevation: 2,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/bg3.png",
                                                      height: 54.h,
                                                      width: 1.sw,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    SizedBox(
                                                      height: 58.h,
                                                      width: 1.sw,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  // mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 20.w,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(3.r),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        child: Image.network(
                                                          data.logo ?? '',
                                                          height: 67.h,
                                                          width: 67.h,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 12.w,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${data.fundraiserName}",
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16.sp,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15.h,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    RichText(
                                                                      text:
                                                                          TextSpan(
                                                                        text:
                                                                            "Goal : ",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          textStyle:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontSize:
                                                                                14.sp,
                                                                            color:
                                                                                AppColors.black2,
                                                                          ),
                                                                        ),
                                                                        children: <TextSpan>[
                                                                          TextSpan(
                                                                            text:
                                                                                '\$${data.goalAmount}',
                                                                            style:
                                                                                GoogleFonts.poppins(
                                                                              textStyle: TextStyle(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 14.sp,
                                                                                color: Colors.black,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '/\$50000',
                                                                            style:
                                                                                GoogleFonts.poppins(
                                                                              textStyle: TextStyle(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontSize: 12.sp,
                                                                                color: AppColors.grey2,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    RichText(
                                                                      text:
                                                                          TextSpan(
                                                                        text:
                                                                            "Members : ",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          textStyle:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontSize:
                                                                                14.sp,
                                                                            color:
                                                                                AppColors.black2,
                                                                          ),
                                                                        ),
                                                                        children: <TextSpan>[
                                                                          TextSpan(
                                                                            text:
                                                                                '${data.totalParticipants}',
                                                                            style:
                                                                                GoogleFonts.poppins(
                                                                              textStyle: TextStyle(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 14.sp,
                                                                                color: Colors.black,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Image.asset(
                                                                "assets/images/right.png",
                                                                height: 34.h,
                                                                width: 34.h,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              SizedBox(
                                                                width: 9.w,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11.h,
                                        ),
                                      ],
                                    );
                                  },
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: joinedFund.length,
                                  itemBuilder: (context, index) {
                                    var data = joinedFund[index];
                                    return Column(
                                      children: [
                                        Material(
                                          elevation: 2,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/bg3.png",
                                                      height: 54.h,
                                                      width: 1.sw,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    SizedBox(
                                                      height: 58.h,
                                                      width: 1.sw,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  // mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 20.w,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(3.r),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        child: Image.network(
                                                          data.logo ?? '',
                                                          height: 67.h,
                                                          width: 67.h,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 12.w,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${data.fundraiserName}",
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16.sp,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15.h,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    RichText(
                                                                      text:
                                                                          TextSpan(
                                                                        text:
                                                                            "Goal : ",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          textStyle:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontSize:
                                                                                14.sp,
                                                                            color:
                                                                                AppColors.black2,
                                                                          ),
                                                                        ),
                                                                        children: <TextSpan>[
                                                                          TextSpan(
                                                                            text:
                                                                                '\$${data.goalAmount}',
                                                                            style:
                                                                                GoogleFonts.poppins(
                                                                              textStyle: TextStyle(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 14.sp,
                                                                                color: Colors.black,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '/\$50000',
                                                                            style:
                                                                                GoogleFonts.poppins(
                                                                              textStyle: TextStyle(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontSize: 12.sp,
                                                                                color: AppColors.grey2,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    RichText(
                                                                      text:
                                                                          TextSpan(
                                                                        text:
                                                                            "Members : ",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          textStyle:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontSize:
                                                                                14.sp,
                                                                            color:
                                                                                AppColors.black2,
                                                                          ),
                                                                        ),
                                                                        children: <TextSpan>[
                                                                          TextSpan(
                                                                            text:
                                                                                '${data.totalParticipants}',
                                                                            style:
                                                                                GoogleFonts.poppins(
                                                                              textStyle: TextStyle(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 14.sp,
                                                                                color: Colors.black,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Image.asset(
                                                                "assets/images/right.png",
                                                                height: 34.h,
                                                                width: 34.h,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              SizedBox(
                                                                width: 9.w,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11.h,
                                        ),
                                      ],
                                    );
                                  },
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
            : const SizedBox.shrink(),
      ],
    );
  }

  Dio get dioClient => DioProvider.dioWithHeaderToken;

  Future<HomeResponseWrapper> getHomeDataApi() {
    var endpoint = "${DioProvider.baseUrl}api/V1/home";
    var dioCall = dioClient.post(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((response) {
        return HomeResponseWrapper.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
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
