import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //margin: EdgeInsets.all(16),
            height: MediaQuery
                .of(context)
                .size
                .height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash_bg.png',),fit: BoxFit.fill)),
            child: Container(
              margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Align(
                    //     alignment: Alignment.bottomRight,
                    //     child: Padding(
                    //       padding: EdgeInsets.only(bottom: 20,right: 10),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.end,
                    //         children: [
                    //           Text('Powered by: '),
                    //           Container(
                    //               height: 35,
                    //               width: 70,
                    //               child: Image.asset('assets/icons/csl_logo.png')
                    //           )
                    //         ],
                    //       ),
                    //     )),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            margin: const EdgeInsets.only(top: 50, right: 0),
                            height: 20,
                            width: 20,
                            child: Image.asset('assets/icons/ex.png'))),

                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Account Setttings',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                    InkWell(onTap: null, child:
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                                'Change PIN', textAlign: TextAlign.left, style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ))
                            ),
                            Text(
                                textAlign: TextAlign.center,
                                'Change your PIN oftenly',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.blue
                                    ))
                            )
                          ]
                      ),
                    ),),
                    InkWell(
                      onTap: null,
                      child: Container(
                        //alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                  'Logout', style: GoogleFonts.inter(
                                  textStyle: const TextStyle(

                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ))
                              ),
                              Text(
                                  textAlign: TextAlign.left,
                                  'Come back soon',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.blue
                                      ))
                              )
                            ]
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
