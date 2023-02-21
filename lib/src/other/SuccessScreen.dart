import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash_bg.png'))),
            child: Container(
                child: Stack(
              children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Powered by: '),
                          Container(
                              height: 35,
                              width: 70,
                              child: Image.asset('assets/icons/csl_logo.png')
                          )
                        ],
                      ),
                    )),
                Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        margin: EdgeInsets.only(top: 50, right: 16),
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/icons/ex.png'))),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        margin: EdgeInsets.only(top: 90),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Success!',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                fontSize: 23,
                              )),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 210, right: 16, left: 16),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Your transaction is Successful Thank you for banking with us',
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                    fontSize: 32,
                                        fontWeight: FontWeight.w300
                                  )
                                  ),
                                )
                            ),
                        Container(
                          margin: EdgeInsets.only(top: 30),
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
                              )
                          ), child: Text(
                          textAlign: TextAlign.center,
                          'Close',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 16,
                              )
                          ),
                        )
                        )
                        )

                          ],
                        )))
              ],
            ))));
  }
}
