import 'package:fc_news/res/dialog.dart';
import 'package:fc_news/utils/routes/routes_name.dart';
import 'package:fc_news/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../repo/auth_repo.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> authApi(dynamic phone, context) async {
    final userPref = Provider.of<UserViewModel>(context, listen: false);
    setLoading(true);
    _authRepo.authApi(phone).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        userPref.saveUser(value['data']['user_id'].toString());
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBarPage);
      }
      else {
      setLoading(false);
      showDialog(
        context: context,
        barrierDismissible:
        false, // Prevent dismissing by tapping outside

        builder: (BuildContext context) {
          return LodingDialog(msg: value['msg']);
        },
      );
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('loginApiError: $error');
      }
    });
  }

  Future<void> registerApi(dynamic data, context) async {
    setLoading(true);
    _authRepo.registerApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBarPage);
        showDialog(
          context: context,
          barrierDismissible:
          false, // Prevent dismissing by tapping outside

          builder: (BuildContext context) {
            return LodingDialog(msg: value['msg']);
          },
        );
      }
      else {
      setLoading(false);
      showDialog(
        context: context,
        barrierDismissible:
        false, // Prevent dismissing by tapping outside

        builder: (BuildContext context) {
          return LodingDialog(msg: value['msg']);
        },
      );
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('registerApi: $error');
      }
    });
  }

  final _otpRepo = AuthRepository();
  Future<void> sedOtpApi(dynamic data, context) async {
    setLoading(true);
    _otpRepo.otpApi(data).then((value) {
      if (value['error'] == "200") {
        setLoading(false);
        Future.delayed(const Duration(seconds: 2),(){
          Navigator.pop(context);
          Navigator.pushNamed(context, RoutesName.verifyPage,arguments: {
            "data":data,
            "otp":value['otp']
          });
        });

        showDialog(
          context: context,
          barrierDismissible:
          false, // Prevent dismissing by tapping outside

          builder: (BuildContext context) {
            return LodingDialog(msg: value['msg']);
          },
        );

      } else {
        setLoading(false);
        showDialog(
          context: context,
          barrierDismissible:
          false, // Prevent dismissing by tapping outside

          builder: (BuildContext context) {
            return LodingDialog(msg: value['msg']);
          },
        );
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('otpError: $error');
      }
    });
  }

  Future<void> verifyOtpApi(dynamic phone,dynamic otp, context) async {
    setLoading(true);
    _otpRepo.verifyOtpApi(phone,otp).then((value) {
      if (value['error'] == "200") {
        setLoading(false);
        authApi(phone,context);
        showDialog(
          context: context,
          barrierDismissible:
          false, // Prevent dismissing by tapping outside

          builder: (BuildContext context) {
            return LodingDialog(msg: value['msg']);
          },
        );
      } else {
        setLoading(false);
        showDialog(
          context: context,
          barrierDismissible:
          false, // Prevent dismissing by tapping outside

          builder: (BuildContext context) {
            return LodingDialog(msg: value['msg']);
          },
        );
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('verifyError: $error');
      }
    });
  }


}