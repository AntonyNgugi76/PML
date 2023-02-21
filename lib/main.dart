import 'package:craft_dynamic/craft_dynamic.dart';
import 'package:craft_dynamic/database.dart';
import 'package:craft_dynamic/dynamic_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pride_flutter/src/auth/LoadingScreen.dart';
import 'package:pride_flutter/src/auth/LoginScreen.dart';
import 'package:pride_flutter/src/auth/SplashScreen.dart';
import 'package:pride_flutter/src/home/DashBoard.dart';
import 'package:pride_flutter/src/home/HomePage.dart';
import 'package:pride_flutter/src/theme/app_theme.dart';

final _auth = AuthRepository();
final _home = HomeRepository();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _sharedPref = CommonSharedPref();
  // _sharedPref.addActivationData('254712464436', '1146400359');
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  await DeviceInfo.performDeviceSecurityScan();
  // await _sharedPref.addActivationData("254712464436", "1146400359");
  // await _sharedPref.addActivationData("254723273535", "1916507095");
  // _auth.activate(mobileNumber: mobileNumber, encryptedPin: encryptedPin)
  final menu = ModuleRepository();
await simpleCall();
  runApp(DynamicCraftWrapper(
      dashboard: const Login(),
      appLoadingScreen: const SplashScreen(),
      appTimeoutScreen: const Login(),
      appInactivityScreen: const Login(),
      appTheme: AppTheme().appTheme,menuColor: Colors.transparent,));
}


 simpleCall() async {
  debugPrint("Simple network call.......................");
  await Dio().get("https://dart.dev");}
