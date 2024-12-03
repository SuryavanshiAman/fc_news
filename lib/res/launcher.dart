//
// import 'package:future_trade/res/api_url.dart';
// import 'package:future_trade/view_model/all_policies_view_model.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class Launcher {
//
//   static void launchURL(String url) async {
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url));
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//   static void downloadApkLauncher() async {
//     var url = "${ApiUrl.baseUrl}apk/future_trade.apk";
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   static void whatsappLaunch() async {
//     var url = "https://api.whatsapp.com/text=Mai+jeet+gaya&type=phone_number&app_absent";
//     // "whatsapp://send?phone="+whatsapp+"&text=hello";
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url));
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//   static  void launchFacebook() async {
//     const fbUrl = 'https://www.facebook.com'; // Open Facebook website
//     const fbAppUrl = 'fb://facewebmodal/f?href=https://www.facebook.com'; // Open Facebook app
//
//     if (await canLaunchUrl(Uri.parse(fbAppUrl))) {
//       await launchUrl(Uri.parse(fbAppUrl));
//     } else if (await canLaunchUrl(Uri.parse(fbUrl))) {
//       await launchUrl(Uri.parse(fbUrl));
//     } else {
//       throw 'Could not launch Facebook';
//     }
//
//   }
// static void openTelegram(context) async {
//   // AllPoliciesViewModel allPoliciesViewModel =AllPoliciesViewModel();
//   final support =Provider.of<AllPoliciesViewModel>(context,listen: false).policiesResponse?.data;
//   // final support=  allPoliciesViewModel.policiesResponse?.data;
//   print(support?.support);
//   if (await canLaunchUrl(Uri.parse(support?.support??""))) {
//     await launchUrl(Uri.parse(support?.support??""));
//   } else {
//     throw "Could not launch ${support?.support ?? ""}";
//   }
// }
// }
