import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash_bg.png'))),
            child: Container(
                child: Stack(
              children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Powered by: '),
                          Container(
                              height: 35,
                              width: 70,
                              child: Image.asset('assets/icons/csl_logo.png'))
                        ],
                      ),
                    )),
                Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        margin: const EdgeInsets.only(top: 50, right: 16),
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/icons/ex.png'))),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        margin: const EdgeInsets.only(top: 90),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Confirmation!',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                fontSize: 23,
                              )),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 210),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'You are about to do at transaction of DSTV payment with the following details:',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300)),
                                )),
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              // color:  Colors.grey,
                              height: 148,
                              width: 358,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                                    side: BorderSide(width: 0.5, color: Colors.black45)),
                                child: Container(

                                  child: Column(
                                      children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 20, left: 10),
                                              child: Column(children: [
                                                 Text(textAlign: TextAlign.left,'2910291219391', style: GoogleFonts.inter(textStyle: TextStyle(
                                                   fontSize: 18,
                                                 )),),
                                                 Text(textAlign: TextAlign.left,'Source Account',style: GoogleFonts.inter(textStyle: TextStyle(
                                                  fontSize: 14,
                                                )),),
                                              ]),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 20, right: 10),
                                              child: Column(children: [
                                                 Text(textAlign: TextAlign.left,'111110',style: GoogleFonts.inter(textStyle: TextStyle(
                                                  fontSize: 18,
                                                )
                                                ),
                                                ),
                                                 Text(textAlign: TextAlign.left,'Recipient',style: GoogleFonts.inter(textStyle: TextStyle(
                                                fontSize: 14,
                                                )),),
                                              ]),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 20, left: 10),
                                                  child: Column(children: [
                                                     Text(textAlign: TextAlign.left,'1,000',style: GoogleFonts.inter(textStyle: TextStyle(
                                                      fontSize: 18,
                                                    )),),
                                                     Text(textAlign: TextAlign.left,'Amount',style: GoogleFonts.inter(textStyle: TextStyle(
                                                      fontSize: 14,
                                                    )),),
                                                  ]),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 20, right: 10),
                                                  child: Column(children: [
                                                     Text(textAlign: TextAlign.left,'100',style: GoogleFonts.inter(textStyle: TextStyle(
                                                      fontSize: 18,
                                                    )),),
                                                     Text(textAlign: TextAlign.left,'Charges',style: GoogleFonts.inter(textStyle: TextStyle(
                                                       fontSize: 14,
                                                     )),),
                                                  ]),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                  ]),
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 30),
                                height: 40,
                                width: 358,
                                child: ElevatedButton(
                                    onPressed: () {
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (context) => Success()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        //primary: const Color(0xffF16225),
                                        shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    )),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Confirm',
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                        fontSize: 16,
                                      )),
                                    ))),
                            Container(
                                margin: const EdgeInsets.only(top: 30),
                                height: 40,
                                width: 358,
                                child: OutlinedButton(
                                    onPressed: () {
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (context) => Success()));
                                    },
                                    style: OutlinedButton.styleFrom(
                                        side:  BorderSide(
                                            width: 1, color: Colors.orange),

                                        //primary:  Color(0xFFFFFFFF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        )),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Cancel',
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                        color: Colors.orange,
                                        fontSize: 16,
                                      )),
                                    )))
                          ],
                        )))
              ],
            ))));
  }
}
