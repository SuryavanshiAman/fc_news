// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fc_news/controller/profile_controller.dart';
import 'package:fc_news/generated/assets.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/model/register_model.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/res/custom_container.dart';
import 'package:fc_news/res/dialog.dart';
import 'package:fc_news/utils/routes/routes_name.dart';
import 'package:fc_news/utils/toast.dart';
import 'package:fc_news/view/home/home_screen.dart';
import 'package:fc_news/view_model/auth_view_model.dart';
import 'package:fc_news/view_model/user_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import '../../res/pinput/pinput.dart';

class VerifyPage extends StatefulWidget {
  // final String? arguments;
  const VerifyPage({super.key, });

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final TextEditingController otpCon = TextEditingController();

  int countdown = 30;
  late Timer countdownTimer;

  void startCountdown() {
    setState(() {
      countdown = 30;
    });
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown == 0) {
        timer.cancel();
        setState(() {});
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    // final aman= widget.arguments;
    // final aman = widget.arguments; // Retrieve arguments
    // if (aman is Map<String, dynamic>) {
    //   final data = aman['data']; // Extract 'data'
    //   final otp = aman['otp'];   // Extract 'otp'
    //
    //   print('Data: $data'); // Should print 7458946942
    //   print('OTP: $otp');   // Should print 491046
    // } else {
    //   print('Arguments are not in the expected format');
    // }
   //  final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
   // String phone=arguments['data'];
   // String otp=arguments['otp'];
   // print(otp.toString());
   // print(otp);
    final userPref = Provider.of<UserViewModel>(context,);
    final verify = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
          ),
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              Image.asset(
                Assets.imagesLogin,
                scale: 1.5,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                'Enter OTP',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    'Enter OTP sent to ${7458946942}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.edit))
                ],
              ),
              SizedBox(
                height: height / 30,
              ),
              Pinput(
                controller: otpCon,
                length: 4,
                defaultPinTheme: PinTheme(
                  width: width * 0.2,
                  height: height * 0.07,
                  textStyle: TextStyle(fontSize: 20, color: AppColor.black),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColor.secondaryColor,
                      width: 2,
                    ),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: width * 0.2,
                  height: height * 0.07,
                  textStyle:
                      const TextStyle(fontSize: 20, color: AppColor.labelColor),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColor.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              countdown != 0
                  ? RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Retry in",
                              style: TextStyle(color: AppColor.black)),
                          TextSpan(
                            text: ' $countdown sec',
                            style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        startCountdown();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.05,
                        width: width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          border: Border.all(color: AppColor.secondaryColor),
                        ),
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(
                            color: AppColor.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomContainer(
                alignment: Alignment.center,
                height: height * 0.05,
                gradient: const LinearGradient(
                    colors: [AppColor.primaryColor, AppColor.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                child: const Text(
                  "Verify",
                  style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                onTap: () async {
                  if (otpCon.text.isEmpty) {
                    showCustomSnackbar(
                        context, "Please enter OTP.", ContentType.warning);
                  } else if (otpCon.text.length != 4) {
                    showCustomSnackbar(context, "Please enter proper OTP.",
                        ContentType.warning);
                  } else {
                    verify.verifyOtpApi(7458946942, otpCon.text, context);
                    Data? existingUser = await DBHelper().getUserByNumber(7458946942.toString());
                    userPref.saveUser(existingUser?.id.toString()??"");
                    if (existingUser != null) {
                      showDialog(
                        context: context,
                        barrierDismissible:
                            false, // Prevent dismissing by tapping outside

                        builder: (BuildContext context) {
                          return LodingDialog(msg: "Verifying OTP...");
                        },
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                            context, RoutesName.bottomNavBarPage);
                        Provider.of<ProfileController>(context,listen: false).fetchCurrentLocation(context);
                      });

                      showCustomSnackbar(context, "OTP Verified Successfully.",
                          ContentType.success);
                    } else {
                      // Show an error message or pop-up because user doesn't exist
                      showCustomSnackbar(
                          context,
                          "No account found with this phone number.",
                          ContentType.warning);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
