import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fc_news/generated/assets.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/model/register_model.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/res/custom_container.dart';
import 'package:fc_news/res/custom_text_field.dart';
import 'package:fc_news/utils/routes/routes_name.dart';
import 'package:fc_news/utils/toast.dart';
import 'package:fc_news/view/auth/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController(); 
  final TextEditingController _phoneController = TextEditingController(); 
  // final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
             left: width * 0.06, right: width * 0.06),
          padding: const EdgeInsets.all(35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.imagesLogin,scale: 1.5,),
              Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
              ),
              SizedBox(height: height*0.02,),
              const Text(
                "Welcome Let's create your account ",
                style: TextStyle(
                    color: AppColor.textGray,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height*0.01,),
               Text(
                "Name.",
                style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height*0.01,),
              CustomTextField(
                controller: _nameController,
                label: "Enter your name",
                hintColor: AppColor.labelColor,
                hintSize: 14,
                // width: width >= 450 ? width * 0.25 : width * 0.65,
                height: 50,
                filled: false,
                border: Border.all(color: AppColor.gray.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(15),
                fieldRadius: BorderRadius.circular(15),
                prefix:  Image.asset(Assets.imagesPerson,scale: 3,),
              ),
               Text(
                "Phone no.",
                style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height*0.01,),
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
              // const Text(
              //   "Email",
              //   style: TextStyle(
              //       color: AppColor.labelColor,
              //       fontWeight: FontWeight.w500,
              //       fontSize: 16),
              //   textAlign: TextAlign.center,
              // ),
              // SizedBox(height: height*0.01,),
              // CustomTextField(
              //   controller: _phoneController,
              //   keyboardType: TextInputType.number,
              //   label: "Enter your phone number",
              //   hintColor: AppColor.black,
              //   hintSize: 14,
              //   // width: width >= 450 ? width * 0.25 : width * 0.65,
              //   height: 50,
              //   maxLength: 10,
              //   filled: false,
              //   border: Border.all(color: AppColor.gray.withOpacity(0.3)),
              //   borderRadius: BorderRadius.circular(15),
              //   fieldRadius: BorderRadius.circular(15),
              //   prefix: Image.asset(Assets.imagesEmail,scale: 3,),
              // ),
              SizedBox(height: height*0.01,),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 14, color: Colors.black),
                  children: [
                    TextSpan(
                        text: "Already have an Account? ",
                        style: TextStyle(color: AppColor.black)),
                    TextSpan(
                      text: 'Log in.',
                      style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: height*0.03,),
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
                child: const Text("Sign Up",style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),),
                onTap: ()async{
                  if(_nameController.text.isEmpty){
                    showCustomSnackbar(context, "Please enter your name", ContentType.warning);
                  } else if(_phoneController.text.isEmpty){
                    showCustomSnackbar(context, "Please enter Phone no.", ContentType.warning);
                  }else if(_phoneController.text.length !=10){
                    showCustomSnackbar(context, "Please enter proper Phone no.", ContentType.warning);
                  }else{
                    Data user = Data(userName: _nameController.text, number: _phoneController.text);
                    await DBHelper().insertUser(user);
                    int count = await DBHelper().getUserCount();
                    print("Total users in the database: $count");
                    Navigator.pushNamed(context, RoutesName.bottomNavBarPage);
                    showCustomSnackbar(context, "Register Successfully.", ContentType.success);
                  }
                },
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
