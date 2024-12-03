import 'package:fc_news/generated/assets.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/res/custom_container.dart';
import 'package:fc_news/res/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // color: AppColor.secondaryColor.withOpacity(0.3),
        decoration: BoxDecoration(
            color: AppColor.black.withOpacity(0.3),
          image: const DecorationImage(image: AssetImage(Assets.imagesBg),fit: BoxFit.fill)
        ),
        child: Container(
          margin: EdgeInsets.only(
              top: height * 0.15, left: width * 0.06, right: width * 0.06,bottom:  height * 0.15,),
          padding: const EdgeInsets.all(35),
          decoration: BoxDecoration(
              color: AppColor.white,

              borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
              ),
              SizedBox(height: height*0.02,),
              const Text(
                "Welcome Let's dive into your account ",
                style: TextStyle(
                    color: AppColor.textGray,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height*0.01,),
               const Text(
                "Phone no.",
                style: TextStyle(
                    color: AppColor.labelColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height*0.01,),
              CustomTextField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                label: "Enter your phone number",
                hintColor: AppColor.black,
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
              SizedBox(height: height*0.01,),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 14, color: Colors.black),
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
                      recognizer: TapGestureRecognizer()..onTap = () {
                        // Navigator.pushNamed(context, RoutesName.registerScreen);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: height*0.06,),
              CustomContainer(
                alignment: Alignment.center,
                height: height*0.05,
                gradient: const LinearGradient(
                  colors: [AppColor.primaryColor,AppColor.secondaryColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
               child: const Text("Sign in",style: TextStyle(
                   color: AppColor.white,
                   fontWeight: FontWeight.w500,
                   fontSize: 16),),
              ),
              SizedBox(height: height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomContainer(
                    widths: width*0.3,
                    height:1,
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
                    widths: width*0.3,
                    height:1,
                    color: AppColor.labelColor,
                  ),
              ],),
              SizedBox(height: height*0.02,),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                        fontSize: 16,fontWeight: FontWeight.w500 ),
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
                        recognizer: TapGestureRecognizer()..onTap = () {
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
