import 'package:flutter/material.dart';

import 'color-const.dart';



class ConstantButton extends StatefulWidget {
  const ConstantButton({
    super.key,
    required this.onTap,
    required this.text,
    this.btnColor = const Color(0xff3bad19),
    this.textColor =  AppColor.white,
    this.border,
    this.width,
    this.height,
    this.gradient,
    this.margin,
    this.borderRadius

  });

  final Function() onTap;
  final String text;
  final Color? btnColor;
  final Color? textColor;
  final BoxBorder? border;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;


  @override
  State<ConstantButton> createState() => _ConstantButtonState();
}

class _ConstantButtonState extends State<ConstantButton> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Ink(
        child: Card(
          elevation: 3,
          margin:widget.margin ,
          shape: RoundedRectangleBorder(
            borderRadius:widget.borderRadius?? BorderRadius.circular(
                5
            ),
          ),
          child: Container(

            width:widget.width??width*0.5,
            height:widget.height??height*0.05,
            decoration: BoxDecoration(
              color: widget.btnColor,
              borderRadius:widget.borderRadius?? BorderRadius.circular(
                2,
              ),
              border: widget.border,
            ),
            child: Center(
              child: Text(
                widget.text,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: widget.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  letterSpacing: 1.25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



}