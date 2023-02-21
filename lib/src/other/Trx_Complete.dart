import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pride_flutter/src/auth/LoginScreen.dart';

class ThankYou_Screen extends StatefulWidget {
  const ThankYou_Screen({Key? key}) : super(key: key);

  @override
  State<ThankYou_Screen> createState() => _ThankYou_ScreenState();
}

class _ThankYou_ScreenState extends State<ThankYou_Screen> {
  String? _feedback;
  Color _color = Colors.white;
  @override
  Widget build(BuildContext context) {
    String _value = '';
    return Scaffold(
        body: Container(
      // margin: EdgeInsets.only(left: 16, right: 16),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/thanks_bg.png'),
              fit: BoxFit.fill)),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
            child: Column(
        children: [
          Container(
            // margin: const EdgeInsets.only(left: 16, right: 16),
            // height: 483,
            // width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 180),
                  child: Text(
                    'Thank you for using Pride Mobile!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    'You have logged out successfully.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 28, left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    child: const Divider(
                      height: 20,
                      thickness: 1,
                      // indent: 20,
                      // endIndent: 0,
                      color: Colors.white,
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 16, right: 16, bottom:30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,


                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login', textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.white)),
                          ),
                          Text('11 Jan 2023',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: Colors.white))),
                          Text('09:15:15',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: Colors.white))),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Logout',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.white)),
                          ),
                          Text('11 Jan 2023',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: Colors.white))),
                          Text('09:15:15',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: Colors.white))),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Duration',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.white)),
                          ),
                          // Text('11 Jan 2023',
                          //     style: GoogleFonts.inter(
                          //         textStyle: const TextStyle(
                          //             fontWeight: FontWeight.w300,
                          //             fontSize: 16,
                          //             color: Colors.white))),
                          Text('09:15:15',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: Colors.white))),
                        ],
                      )
                    ],
                  ),
                ),

                Container(
                  height: 361,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 16, right:  16, top: 30
                        ),
                        child: Text('We value your Feedback',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.black54)))
                        ,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 16, right:  16, top: 10, bottom: 30
                        ),
                        child: Text('Please rate your overall experience on the App. Tap on one of the icons to rate.',
                            style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Colors.black45)))
                        ,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Column(
                            children: [
                              GestureDetector(
                                onTap: () { setState(() {
                                  _feedback = 'Very poor';
                                });
                                debugPrint('feeback $_feedback');
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  height: 40,
                                  width: 40,
                                  // color: _value == 'Very Poor' ? Colors.grey : Colors.black12,
                                  child: Image.asset('assets/icons/very_por.png'),
                                ),
                              ),
                              Text('Very Poor', style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12, color:Colors.black45
                                )
                              ),)


                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () { setState(() {
                                  _feedback = 'Poor';
                                });
                                debugPrint('feeback $_feedback');
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  height: 40,
                                  width: 40,
                                  // color: _value == 0 ? Colors.grey : Colors.transparent,
                                  child: Image.asset('assets/icons/poor.png'),
                                ),
                              ),
                              Text('Poor', style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12, color:Colors.black45
                                )
                              ),)


                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () { setState(() {
                                  _feedback = 'Average';
                                });
                                debugPrint('feeback $_feedback');
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  height: 40,
                                  width: 40,
                                  // color: _value == 0 ? Colors.grey : Colors.transparent,
                                  child: Image.asset('assets/icons/average.png'),
                                ),
                              ),
                              Text('Average', style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12, color:Colors.black45
                                )
                              ),)


                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    //_color= Colors.grey;
                                    _feedback = 'Good';

                                  } );
                                  debugPrint('feedback $_feedback');

    }
                                ,child: Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  height: 40,
                                  width: 40,
                                  color: _value == Colors.transparent ? Colors.grey : Colors.transparent,
                                  child: Image.asset('assets/icons/good.png'),
                                ),
                              ),
                              Text('Good', style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12, color:Colors.black45
                                )
                              ),)


                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () { setState(() {
                                  _feedback = 'Very Good';
                                  _color == Colors.transparent

                                      ? _color//checks value of color
                                  = Colors.yellow
                                      : _color = Colors.transparent;
                                });
                                debugPrint('$_feedback');
                                },

                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  height: 40,
                                  width: 40,
                                  // color: _value == 0 ? Colors.grey : Colors.transparent,
                                  child: Image.asset('assets/icons/very_good.png'),
                                ),
                              ),
                              Text('Very Good', style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12, color:Colors.black45
                                )
                              ),)


                            ],
                          ),

                            // GestureDetector(
                            //   onTap: () => setState(() => _value = 'Poor'),
                            //   child: Container(
                            //     height: 56,
                            //     width: 56,
                            //     //color: _value == 1 ? Colors.grey : Colors.transparent,
                            //     child: Icon(Icons.message),
                            //   ),
                            // ),
                        ]
                      )),
                      Container(
                          margin: const EdgeInsets.only(top: 30, left: 16),
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
                                'Submit',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                    )),
                              ))),
                      Container(
                          margin: const EdgeInsets.only(top: 30, right:16, left: 16),
                          height: 40,
                          width: 358,
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                    builder: (context) => const Login()), (route)=> false);
                              },
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 1, color: Colors.orange),

                                  //primary:  Color(0xFFFFFFFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(50.0),
                                  )),
                              child: Text(
                                textAlign: TextAlign.center,
                                'Not Now',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      color: Colors.orange,
                                      fontSize: 16,
                                    )),
                              )))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    )
    )
    );
  }
}
