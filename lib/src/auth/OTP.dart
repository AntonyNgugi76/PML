import 'package:craft_dynamic/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:craft_dynamic/craft_dynamic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pride_flutter/src/auth/LoginScreen.dart';
import 'package:pride_flutter/src/other/alert.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:vibration/vibration.dart';

class OTPVerification extends StatefulWidget {
  OTPVerification({Key? key, required this.mobileNumber}) : super(key: key);
  String mobileNumber;

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> with CodeAutoFill {
  final _authRepository = AuthRepository();
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  bool isLoading = false;
  String? appSignature;
  String? otpCode;

  @override
  void codeUpdated() {
    setState(() {
      otpCode = code!;
    });
  }

  @override
  void initState() {
    super.initState();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        debugPrint("App signature...$signature");
        appSignature = signature;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text("OTP Verification"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 SizedBox(height: 20,),
                 SizedBox(height: 20,),
                  // CommonWidgets.widgetSpacer(),
                  Text(
                    "Enter OTP sent via sms/e-mail",
                    style: GoogleFonts.inter(textStyle: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16
                    )),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: PinFieldAutoFill(
                        controller: _otpController,
                        decoration: BoxLooseDecoration(
                            gapSpace: 8,
                            bgColorBuilder:
                            FixedColorBuilder(Colors.grey[200]!),
                            strokeColorBuilder:
                            const FixedColorBuilder(Colors.transparent)),
                        currentCode: otpCode,
                        onCodeSubmitted: (code) {},
                        onCodeChanged: (code) {
                          if (code!.length == 6) {
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                      )),
                  const SizedBox(
                    height: 58,
                  ),
                  isLoading
                      ? Center(
                      child:
                          SpinKitCircle(color: Colors.green,)
                      )
                      : WidgetFactory.buildButton(
                      context, verifyOTP, "Verify OTP")
                ],
              ))),
      backgroundColor: const Color(0xfffafafa),
    );
  }

  verifyOTP() {
    String msg;
    if (_formKey.currentState!.validate()) {
      if (_otpController.text.length == 6) {
        setState(() {
          isLoading = true;
        });
        _authRepository
            .verifyOTP(
            mobileNumber: widget.mobileNumber, otp: _otpController.text)
            .then((value) async => {
          if (value.status == StatusCode.success.statusCode)
            {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Login()),
                      (r) => false)
            }
          else
            {
              msg = value.message ?? "Unknown error",
              UserAlert.showAlertDialog(
                  context, msg.isNotEmpty ? msg : "Error")
            },
          setState(() {
            isLoading = false;
          })
        });
      } else {
        Vibration.vibrate();
        Fluttertoast.showToast(
            msg: "Enter correct OTP!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    EasyLoading.dismiss();
  }
}
