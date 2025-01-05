import 'package:flutter/material.dart';

import 'color-const.dart';


class LodingDialog extends StatelessWidget {
  late  String msg;

  LodingDialog({super.key, required this.msg});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(25),
      shape: const RoundedRectangleBorder(),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const CircularProgressIndicator(
            color: AppColor.primaryColor,
          ),
          const SizedBox(width: 20),
          Text(
            msg,
            style: const TextStyle(
                fontFamily: "NewYork", fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

}
