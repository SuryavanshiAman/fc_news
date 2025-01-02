
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms&Condition",style: TextStyle(fontFamily: "NewYork",fontWeight: FontWeight.w600),),
      ),
      body:const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: HtmlWidget("How can you make the most of this integral part of your marketing strategy?"

                "In this article, discover what makes an exceptional About Us page and find 25 examples to inspire your own page design and content."

                "What Makes A Great About Us Page?"
                "There is no definitive template for creating a great About Us page."

                "However, I found four key components to making a compelling narrative with your brand story."

                "Your Vision And Mission"
                "There is rarely a need to outright say, “Our vision/mission is ____,” but you ought to convey the purpose of your business in your About Us copy."

                "Talk about why your brand exists, what makes you different, and the challenges you solve – beyond the obvious solution you sell."

                "This is key for attracting talent, as well as prospective buyers who align with your objectives and value goals."),
          )),
    );
  }

}
