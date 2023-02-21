import 'package:craft_dynamic/craft_dynamic.dart';
import 'package:craft_dynamic/database.dart';
import 'package:craft_dynamic/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pride_flutter/src/other/alert.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  final _bankAccountRepository = BankAccountRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Accounts'),

        ),
        body: Column(
          children: [
            FutureBuilder<List<BankAccount>>(
                future: _bankAccountRepository
                    .getAllBankAccounts(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<BankAccount>>
                    snapshot) {
                  debugPrint('snapbank...${snapshot.data}');

                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder:
                          (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  left: 8,
                                  right: 8,
                                ),
                                height: 50,
                                // width: 350,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width *
                                    0.85,

                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Container(
                                        height: 60,
                                        // width: 120,
                                        margin:
                                        const EdgeInsets
                                            .only(
                                            left: 8),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                'assets/images/db_.png'),
                                            Text(
                                              '  ${snapshot.data?[index]
                                                  .aliasName}',
                                              style: GoogleFonts.inter(
                                                  textStyle: const TextStyle(
                                                      color: Colors
                                                          .black45,
                                                      fontSize:
                                                      14,
                                                      fontWeight:
                                                      FontWeight.w400)),
                                            )
                                          ],
                                        )),
                                    Container(
                                      margin: const EdgeInsets
                                          .only(
                                          top: 8,
                                          left: 8,
                                          right: 8),
                                      // width: 60,
                                      // height: 40,
                                      child: Row(
                                        children: [
                                          InkWell(
                                            child: ClipRRect(
                                              borderRadius:
                                              const BorderRadius
                                                  .only(),
                                              child:
                                              Container(
                                                alignment:
                                                Alignment
                                                    .center,
                                                width: 68,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius
                                                        .only(
                                                        topLeft: Radius
                                                            .circular(
                                                            30),
                                                        bottomLeft: Radius
                                                            .circular(
                                                            30)),
                                                    border: Border.all(
                                                        color:
                                                        Colors.green)),
                                                child: Text(
                                                  textAlign:
                                                  TextAlign
                                                      .center,
                                                  'Statement',
                                                  style: GoogleFonts.inter(
                                                      textStyle: const TextStyle(
                                                          color: Colors
                                                              .green,
                                                          fontSize:
                                                          10,
                                                          fontWeight:
                                                          FontWeight.w300)),
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              UserAlert.showAlertDialog(
                                                  context,
                                                  "Continue to view account ministatement",
                                                  isConfirm:
                                                  true)
                                                  .then(
                                                      (value) {
                                                    if (value) {
                                                      //checkMiniStatement();
                                                    }
                                                  });
                                            },
                                          ),
                                          InkWell(
                                              child: ClipRRect(
                                                borderRadius:
                                                const BorderRadius
                                                    .only(
                                                  // topRight: Radius.circular(30),
                                                  // bottomRight: Radius.circular(30)
                                                ),
                                                child: Container(
                                                  alignment:
                                                  Alignment
                                                      .center,
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      right:
                                                      10),
                                                  width: 68,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius: const BorderRadius
                                                          .only(
                                                          topRight:
                                                          Radius.circular(
                                                              30),
                                                          bottomRight:
                                                          Radius.circular(
                                                              30)),
                                                      border: Border.all(
                                                          color: Colors
                                                              .orange)),
                                                  child: Text(
                                                    textAlign:
                                                    TextAlign
                                                        .center,
                                                    'Balance',
                                                    style: GoogleFonts.inter(
                                                        textStyle: const TextStyle(
                                                            color: Colors
                                                                .orange,
                                                            fontSize:
                                                            10,
                                                            fontWeight:
                                                            FontWeight.w300)),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                UserAlert.showAlertDialog(
                                                    context,
                                                    "Continue to view account Balance?",
                                                    isConfirm:
                                                    true)
                                                    .then(
                                                        (value) {
                                                      if (value) {
                                                        //checkMiniStatement();
                                                      }
                                                    });
                                              }
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return LoadUtil();
                  }
                }),
            // ListView(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   children: [
            //     Container(
            //       child: Column(
            //         children: [
            //           Container(
            //             margin: const EdgeInsets.only(
            //               top: 10,
            //               left: 8,
            //               right: 8,
            //             ),
            //             height: 50,
            //             // width: 350,
            //             width: MediaQuery.of(context)
            //                     .size
            //                     .width *
            //                 0.85,
            //
            //             child: Row(
            //               crossAxisAlignment:
            //                   CrossAxisAlignment.start,
            //               mainAxisAlignment:
            //                   MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Container(
            //                     height: 60,
            //                     // width: 120,
            //                     margin: const EdgeInsets.only(
            //                         left: 8),
            //                     child: Row(
            //                       children: [
            //                         Image.asset(
            //                             'assets/images/db_.png'),
            //                         Text(
            //                           'Current Account',
            //                           style: GoogleFonts.inter(
            //                               textStyle: const TextStyle(
            //                                   color: Colors
            //                                       .black45,
            //                                   fontSize: 14,
            //                                   fontWeight:
            //                                       FontWeight
            //                                           .w400)),
            //                         )
            //                       ],
            //                     )),
            //                 Container(
            //                   margin: const EdgeInsets.only(
            //                       top: 8, left: 8, right: 8),
            //                   // width: 60,
            //                   // height: 40,
            //                   child: Row(
            //                     children: [
            //                       ClipRRect(
            //                         borderRadius:
            //                             const BorderRadius
            //                                 .only(),
            //                         child: Container(
            //                           alignment:
            //                               Alignment.center,
            //                           width: 68,
            //                           height: 40,
            //                           decoration: BoxDecoration(
            //                               borderRadius: const BorderRadius
            //                                       .only(
            //                                   topLeft: Radius
            //                                       .circular(
            //                                           30),
            //                                   bottomLeft: Radius
            //                                       .circular(
            //                                           30)),
            //                               border: Border.all(
            //                                   color: Colors
            //                                       .green)),
            //                           child: Text(
            //                             textAlign:
            //                                 TextAlign.center,
            //                             'Statement',
            //                             style: GoogleFonts.inter(
            //                                 textStyle: const TextStyle(
            //                                     color: Colors
            //                                         .green,
            //                                     fontSize: 10,
            //                                     fontWeight:
            //                                         FontWeight
            //                                             .w300)),
            //                           ),
            //                         ),
            //                       ),
            //                       ClipRRect(
            //                         borderRadius: const BorderRadius
            //                                 .only(
            //                             // topRight: Radius.circular(30),
            //                             // bottomRight: Radius.circular(30)
            //                             ),
            //                         child: Container(
            //                           alignment:
            //                               Alignment.center,
            //                           padding:
            //                               const EdgeInsets
            //                                       .only(
            //                                   right: 10),
            //                           width: 68,
            //                           height: 40,
            //                           decoration: BoxDecoration(
            //                               borderRadius: const BorderRadius
            //                                       .only(
            //                                   topRight: Radius
            //                                       .circular(
            //                                           30),
            //                                   bottomRight: Radius
            //                                       .circular(
            //                                           30)),
            //                               border: Border.all(
            //                                   color: Colors
            //                                       .orange)),
            //                           child: Text(
            //                             textAlign:
            //                                 TextAlign.center,
            //                             'Balance',
            //                             style: GoogleFonts.inter(
            //                                 textStyle: const TextStyle(
            //                                     color: Colors
            //                                         .orange,
            //                                     fontSize: 10,
            //                                     fontWeight:
            //                                         FontWeight
            //                                             .w300)),
            //                           ),
            //                         ),
            //                       )
            //                     ],
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Divider(),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // Align(
            //     alignment: Alignment.bottomRight,
            //     child: InkWell(
            //       onTap: null,
            //       child: Container(
            //         margin: EdgeInsets.only(
            //           bottom: 9,
            //         ),
            //         child: Text(
            //           'View All Accounts   ',
            //           style: GoogleFonts.inter(
            //               textStyle: const TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 12,
            //                   fontWeight: FontWeight.w600)),
            //         ),
            //       ),
            //     ))
          ],
        ),
    );
  }
}
