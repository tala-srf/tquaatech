import 'package:flutter/material.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/widgets/app_bar.dart';

class Home1 extends StatelessWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Home"),
      
      
      body: Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/welcome.png")),)
      ),
    );
  }
}