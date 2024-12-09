import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void showCustomSnackbar(BuildContext context, String message, ContentType contentType) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: AwesomeSnackbarContent(
        title: contentType == ContentType.success ? 'Success' : 'Warning',
        message: message,
        contentType: contentType,
        color: contentType == ContentType.success ? Colors.green:Colors.red,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}