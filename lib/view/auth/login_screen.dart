import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fc_news/generated/assets.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/model/register_model.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/res/custom_container.dart';
import 'package:fc_news/res/custom_text_field.dart';
import 'package:fc_news/utils/routes/routes_name.dart';
import 'package:fc_news/utils/toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: width * 0.06,
            right: width * 0.06,
          ),
          padding: const EdgeInsets.all(35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Assets.imagesLogin,
                scale: 1.5,
              ),
              Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                "Welcome Let's dive into your account ",
                style: TextStyle(
                    color: AppColor.textGray,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "Phone no.",
                style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                label: "Enter your phone number",
                hintColor: AppColor.labelColor,
                hintSize: 14,
                // width: width >= 450 ? width * 0.25 : width * 0.65,
                height: 50,
                maxLength: 10,
                filled: false,
                border: Border.all(color: AppColor.gray.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(15),
                fieldRadius: BorderRadius.circular(15),
                prefix: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "+91 |",
                    style:
                        TextStyle(color: AppColor.primaryColor, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  children: [
                    TextSpan(
                        text: "Don't have an Account? ",
                        style: TextStyle(color: AppColor.black)),
                    TextSpan(
                      text: 'Register.',
                      style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigator.pushNamed(
                          //     context, RoutesName.registerScreen);
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const RegisterScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0); // Right to left
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);
                                return SlideTransition(
                                    position: offsetAnimation, child: child);
                              },
                              transitionDuration: const Duration(seconds: 1),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.06,
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
                  "Sign in",
                  style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                onTap: () {
                  if (_phoneController.text.isEmpty) {
                    showCustomSnackbar(
                        context, "Please enter Phone no.", ContentType.warning);
                  } else if (_phoneController.text.length != 10) {
                    showCustomSnackbar(context, "Please enter proper Phone no.",
                        ContentType.warning);
                  } else {

                    Navigator.pushNamed(context, RoutesName.verifyPage,
                        arguments: _phoneController.text);
                    showCustomSnackbar(
                        context, "OTP Send Successfully.", ContentType.success);

                  }
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomContainer(
                    widths: width * 0.3,
                    height: 1,
                    color: AppColor.labelColor,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                        color: AppColor.gray,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                  CustomContainer(
                    widths: width * 0.3,
                    height: 1,
                    color: AppColor.labelColor,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: "Login as a ",
                          style: TextStyle(color: AppColor.black)),
                      TextSpan(
                        text: 'Guest..',
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.pushNamed(context, RoutesName.registerScreen);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
