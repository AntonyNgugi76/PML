import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:craft_dynamic/craft_dynamic.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pride_flutter/src/other/alert.dart';
import 'package:pride_flutter/src/other/ministmt.dart';
import 'package:pride_flutter/src/state/app_state.dart';
import 'package:pride_flutter/src/utils/Utils.dart';

import '../other/constants.dart';

class AccountCard extends StatefulWidget {
  final BankAccount bankAccount;

  const AccountCard({super.key, required this.bankAccount});

  @override
  State<StatefulWidget> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  bool _isLoading = false;
  var _accountVisible = false;
  var _balance = "Not available";
  final _profileRepository =  ProfileRepository();

  @override
  Widget build(BuildContext context) {
    final bankAccount = widget.bankAccount;

    return Center(
      child: Material(
          elevation: 2,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color: _isLoading
              ? Theme.of(context).colorScheme.primary.withOpacity(.8)
              : Theme.of(context).colorScheme.primary,
          child: Stack(
            children: [
              Container(
                  height: 200,
                  decoration: const BoxDecoration(),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Balance",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              )),
                          IconButton(
                            onPressed: () {
                              UserAlert.showAlertDialog(context,
                                  "Continue to view account ministatement",
                                  isConfirm: true)
                                  .then((value) {
                                if (value) {
                                  checkMiniStatement();
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.info_outline,
                              size: 34,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _accountVisible
                              ? Text(
                            _balance,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                              : Blur(
                              blur: 3,
                              blurColor: Theme.of(context).primaryColor,
                              child: const Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 4),
                                  child: Text("XXXXXXX"))),
                          const SizedBox(
                            width: 24,
                          ),


                          IconButton(
                              iconSize: 32,
                              onPressed: () {
                                setState(() {
                                  _accountVisible = !_accountVisible;
                                });

                                if (_accountVisible) {
                                  _isLoading = true;
                                  showLoadingScreen.value = true;
                                  _profileRepository
                                      .checkAccountBalance(
                                      bankAccount.bankAccountId)
                                      .then((value) {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    showLoadingScreen.value = false;
                                    if (value != null) {
                                      if (value.status ==
                                          StatusCode.success.statusCode) {
                                        _balance = value.resultsData
                                            ?.firstWhere((e) =>
                                        e["ControlID"] ==
                                            "BALTEXT")[
                                        "ControlValue"] ??
                                            "Not available";
                                      } else {
                                        UserAlert.showAlertDialog(
                                            context, value.message ?? "Error");
                                      }
                                    }
                                  });
                                }
                              },
                              icon: Icon(
                                _accountVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: secondaryAccent,
                              ))
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(bankAccount.bankAccountId,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  letterSpacing: 2)),
                          const Spacer(),
                          Text(bankAccount.aliasName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ))
                        ],
                      ),
                    ],
                  )),
              _isLoading
                  ? ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.6, sigmaY: 0.6),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.grey.shade200.withOpacity(.4)),
                  ),
                ),
              )
                  : const SizedBox(),
              _isLoading
                  ? Positioned(
                right: 0,
                left: 0,
                top: 0,
                bottom: 0,
                child: Lottie.asset("assets/lottie/loading_list.json"),
              )
                  : const SizedBox()
            ],
          )),
    );
  }

  checkMiniStatement() {
    setState(() {
      _isLoading = true;
    });
    _profileRepository
        .checkMiniStatement(widget.bankAccount.bankAccountId)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
      if (value?.status == StatusCode.success.statusCode) {
        Utils.navigateToScreen(
            context, MiniStatement(ministatement: value?.accountStatement));
      } else {
        UserAlert.showAlertDialog(context, value?.message ?? "Error");
      }
    });
  }
}
