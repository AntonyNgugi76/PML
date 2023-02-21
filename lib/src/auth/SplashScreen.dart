import 'package:craft_dynamic/craft_dynamic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pride_flutter/src/auth/LoginScreen.dart';
import 'dart:async';
import 'package:pride_flutter/src/home/HomePage.dart';
import 'package:pride_flutter/src/other/Profile.dart';
import 'package:pride_flutter/src/other/Confirmation_Screen.dart';
import 'package:pride_flutter/src/other/Settings.dart';
import 'package:pride_flutter/src/other/SuccessScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _initRepo = InitRepository();
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 5),
    //         ()=>Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder:
    //             (context) => Login()
    //         )
    //     )
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height ,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash_bg.png'),
              fit: BoxFit.cover)),
        child: SizedBox(

        child: Stack(

          children: [

            Align( alignment: Alignment.center,
          child:
          Container(
            height: 220,
            width: 220,
            child:
            Image.asset('assets/icons/pml_logo.png', ).animate(    onPlay: (controller) => controller.repeat(), // loop
).shimmer(duration: 1500.ms),

          )),

            Padding(
                padding: const EdgeInsets.all(5),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Powered by:   '),
                        Container(
                          height: 35,
                          width: 70,
                          child:Image.asset('assets/icons/csl_logo.png') ,
                        )

                      ],
                    )))
          ],
        ),
      ),
    ));
  }
}
