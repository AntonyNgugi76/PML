import 'package:craft_dynamic/craft_dynamic.dart';
import 'package:craft_dynamic/database.dart';
import 'package:craft_dynamic/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pride_flutter/src/auth/OTP.dart';
import 'package:pride_flutter/src/home/DashBoard.dart';
import 'package:pride_flutter/src/home/HomePage.dart';
import 'package:pride_flutter/src/other/Profile.dart';
import 'package:pride_flutter/src/other/Confirmation_Screen.dart';
import 'package:pride_flutter/src/other/Settings.dart';
import 'package:pride_flutter/src/other/SuccessScreen.dart';
import 'package:pride_flutter/src/other/Trx_Complete.dart';
import 'package:pride_flutter/src/other/alert.dart';
import 'package:pride_flutter/src/other/map_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _moduleRepository = ModuleRepository();
  final _formKey = GlobalKey<FormState>();
  final _passformKey = GlobalKey<FormState>();
  final _sharedPref = CommonSharedPref();
  final _pincontroller = TextEditingController();
  final _phoneController = TextEditingController();
  String isActivated = 'false';
  bool isLoading = false;
  String? ph_no;

  @override
  void initState() {
    super.initState();
    checkIsActivated();
    // SessionRepository().startSession();
  }

  checkIsActivated() async {
    await _sharedPref.getAppIsActivated().then((value) {
      setState(() {
        isActivated = value;
        if(isActivated == "true") {
          _checkBioLogin();
        }
      });
    });
  }

  _checkBioLogin() async {
    String? bioEnabled = await _sharedPref.getBio();
    if (bioEnabled != null) {
      if (bioEnabled == "true") {
        if (await BioMetricUtil.biometricAuthenticate()) {
          String bioPin = await _sharedPref.getBioPin();
          _pincontroller.text = CryptLib.decryptField(encrypted: bioPin);
          login(pin: _pincontroller.text);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/main_bg.png')),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5.3, right: 5.3),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 53,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 171,
                        width: 171,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/circular_logo.png'))),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(4),
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: Text(
                  //       'Enjoy Banking on your phone!',
                  //       textAlign: TextAlign.center,
                  //       style: GoogleFonts.inter(
                  //           textStyle: const TextStyle(
                  //               fontSize: 52,
                  //               height: 1.2,
                  //               fontWeight: FontWeight.w400,
                  //               color: Colors.white)),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(4),
                  //   child: Text(
                  //     'on your',
                  //     style: GoogleFonts.inter(
                  //         textStyle:
                  //             const TextStyle(fontSize: 40, color: Colors.white)),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(4),
                  //   child: Text(
                  //     'Phone!',
                  //     style: GoogleFonts.inter(
                  //         textStyle:
                  //             const TextStyle(fontSize: 40, color: Colors.white)),
                  //   ),
                  // ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 8, top: 20, bottom: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            isActivated == "true"
                                ? 'Enter Your Pin to Login'
                                : 'Enter Details to Activate',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.57,
                                    color: Colors.white)),
                          ))),

                  isActivated == "true"
                      ? const SizedBox()
                      : Container(
                          margin: const EdgeInsets.only(bottom: 5),

                          padding:
                              const EdgeInsets.only(left: 8, bottom: 5, right: 8),
                          // width: 358,
                          // height: 60,
                          child: Form(
                            key: _formKey,
                            // child: TextFormField(
                            //   controller: _phoneController,
                            //   validator: validateMobile,
                            //   //obscureText: true,
                            //   textAlign: TextAlign.center,
                            //   decoration: InputDecoration(
                            //     contentPadding: EdgeInsets.symmetric(
                            //         vertical: 20, horizontal: 20),
                            //     hintText: ('Enter Phone Number'),
                            //     enabledBorder: OutlineInputBorder(
                            //       borderSide:
                            //           BorderSide(color: Colors.greenAccent),
                            //       borderRadius: BorderRadius.circular(30.0),
                            //     ),
                            //   ),
                            // ),
                            child: IntlPhoneField(
                            disableLengthCheck: true,
                             autovalidateMode:AutovalidateMode.disabled,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20,
                                ),
                                labelText: 'Phone Number',
                                labelStyle: TextStyle(
                                  color: Colors.orange
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              onChanged: (phone) {
                                //print(phone.completeNumber);
                                String sPhone = phone.completeNumber.toString();
                                print(sPhone);
                                setState(() {
                                  ph_no =sPhone;
                                });
                              },
                              initialCountryCode: 'KE',
                              onCountryChanged: (country) {
                                print('Country changed to: ' + country.name);
                              },
                            ),
                          ),
                        ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 8, bottom: 20, right: 8),
                      child: Form(
                        key: _passformKey,
                        child: // Note: Same code is applied for the TextFormField as well
                            TextFormField(
                          controller: _pincontroller,
                          validator: validatePIN,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            hintText: ('Enter PIN'),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 30,
                    ),
                    child: Container(
                        height: 60,
                        width: 358,
                        child: isLoading
                            ? const SpinKitCircle(color: Colors.white,)
                            : ElevatedButton(
                                onPressed: () {
                                  if (
                                      // _formKey.currentState!.validate()
                                      _passformKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    isActivated == "true"
                                        ? login()
                                        : activateApp(ph_no?.formatPhone(),
                                            _pincontroller.text);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffF16225),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    )),

                                // style: ElevatedButton.styleFrom(
                                //   primary: const Color(0xffF16225),
                                //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(18.0),
                                //       //side: BorderSide(color: Colors.red)
                                //   ))// Background color
                                // onPrimary: Colors.amber, // Text Color (Foreground color)
                                // ),
                                child: Text(
                                    isActivated == "true"
                                        ? 'Login'
                                        : "Activate",
                                    style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.57,
                                    ))
                                    // style: TextStyle(fontSize: 40),
                                    ),
                              )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Options',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 13.57,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400)),
                          ))),
                  // Align(alignment: Alignment.bottomCenter,
                  // child:
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 8, top: 20, right: 8, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapView()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Container(
                                  height: 45,
                                  width: 45,
                                  child: Image.asset(
                                      'assets/images/branch_locator_logo.png'),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      'ATM \n Location',
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Colors.white)),
                                    )),
                              ],
                            ),

                          ),

                         InkWell(
                           onTap: (){
                             CommonUtils.openUrl(Uri.parse('tel:+254707424334'));

                           },
                           child:  Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Container(
                                 height: 45,
                                 width: 45,
                                 child:
                                 Image.asset('assets/images/contact_us.png'),
                               ),
                               Padding(
                                   padding: const EdgeInsets.all(5),
                                   child: Text(
                                     'Contact \n Us',
                                     style: GoogleFonts.inter(
                                         textStyle: const TextStyle(
                                             fontWeight: FontWeight.w400,
                                             fontSize: 14,
                                             color: Colors.white)),
                                   )),
                             ],
                           ),
                         )
                        ],
                      ))
                ],
              )),
            )));
  }

  login({pin}) {
    final authrepo = AuthRepository();
    authrepo.login(pin??_pincontroller.text).then((value) async {
      setState(() {
        isLoading = false;
      });
      if (value.status == StatusCode.success.statusCode) {
        Navigator.of(context)
            .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const DashBoard()), (route)=> false);
      } else if (value.status == StatusCode.changePin.statusCode) {
        var _cPin = await _moduleRepository.getModuleById("PIN");
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => DynamicWidget(
                  moduleItem: _cPin,
                )
            )
        )
        );
      }
      else{
        UserAlert.showAlertDialog(context, value.message!);
      }
    }
    );
  }

  activateApp(mobileNumber, pin) {
    final auth = AuthRepository();
    auth.activate(mobileNumber: mobileNumber, pin: pin).then((value) {
      setState(() {
        isLoading = false;
      });
      if (value.status == StatusCode.success.statusCode) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OTPVerification(
                  mobileNumber: mobileNumber,
                )
        ),
        );
      } else {
        UserAlert.showAlertDialog(context, value.message!);
      }
    });
  }

  String? validateMobile(String? value) {
    if (value!.length != 12)
      return 'Input a valid mobile number';
    else
      return null;
  }

  String? validatePIN(String? value) {
    if (value!.length != 4)
      return 'Input a valid PIN';
    else
      return null;
  }
}
