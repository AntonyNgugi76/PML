import 'package:craft_dynamic/craft_dynamic.dart';
import 'package:craft_dynamic/database.dart';
import 'package:craft_dynamic/dynamic_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pride_flutter/src/auth/LoginScreen.dart';
import 'package:pride_flutter/src/home/accounts.dart';
import 'package:pride_flutter/src/other/Constants.dart';
import 'package:pride_flutter/src/other/Profile.dart';
import 'package:pride_flutter/src/other/Settings.dart';
import 'package:pride_flutter/src/other/Trx_Complete.dart';
import 'package:pride_flutter/src/other/account_card.dart';
import 'package:pride_flutter/src/other/alert.dart';
import 'package:pride_flutter/src/other/ministmt.dart';
import 'package:pride_flutter/src/state/app_state.dart';
import 'package:pride_flutter/src/utils/Utils.dart';
import 'package:shimmer/shimmer.dart';

class DashBoard extends StatefulWidget {
  // final BankAccount bankAccount;
  const DashBoard(
      {
      // required this.bankAccount,
      Key? key})
      : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final _advancedDrawerController = AdvancedDrawerController();
  final _moduleRepository = ModuleRepository();
  final _bankAccountRepository = BankAccountRepository();
  final _sharedPref = CommonSharedPref();

  // final _bankAccountRepository = BankAccountRepository();
  final _profileRepository = ProfileRepository();
  final _homeRepository = HomeRepository();
  final _frequent_accessed = FrequentAccessedModuleRepository();
  late String _accounts_val;
  final _profileRepo = ProfileRepository();
  String? firstName;
  List<BankAccount>? _accounts;
  var balance = "Unavailable";
  bool isloading = false;
  String? _fname;
  String? _lname;
  String? _phone;
  String? _email;
  String? _photo;
  String? _idNo;
  String? _welcometext;
  bool _isLoading =  false;
  bool _enabled =  true;
  bool _isLoadingB =  false;

  getTime() {
    TimeOfDay now = TimeOfDay.now();
    debugPrint('timeeee##$now');
    int? hour = now.hour;
    debugPrint('hour$hour');
    if (hour <= 12) {
      setState(() {
        _welcometext = 'Good Morning';
      });
    } else if (hour <= 17) {
      setState(() {
        _welcometext = 'Good Afternoon';
      });
    } else {
      setState(() {
        _welcometext = 'Good Evening';
      });
    }
  }

  getfName() async {
    await _profileRepo.getUserInfo(UserAccountData.FirstName).then((value) {
      setState(() {
        _fname = value;
      });
    });
  }

  getlName() async {
    await _profileRepo.getUserInfo(UserAccountData.LastName).then((value) {
      setState(() {
        _lname = value;
      });
    });
  }
  getlId() async {
    await _profileRepo.getUserInfo(UserAccountData.IDNumber).then((value) {
      setState(() {
        _idNo = value;
      });
    });
  }

  getPhoto() async {
    await _profileRepo.getUserInfo(UserAccountData.ImageUrl).then((value) {
      setState(() {
        _photo = value;
      });
    });
  }

  getPhone() async {
    await _profileRepo
        .getUserInfo(UserAccountData.LastLoginDateTime)
        .then((value) {
      setState(() {
        _phone = value;
      });
    });
  }

  getEmail() async {
    await _profileRepo.getUserInfo(UserAccountData.EmailID).then((value) {
      setState(() {
        _email = value;
      });
    });
  }

  @override
  void initState() {
    getEmail();
    getfName();
    getPhone();
    getPhoto();
    getlName();
    getUserInfo();
    getAccounts();
    getBalance();
    getTime();

    super.initState();
  }

  getUserInfo() async {
    await _profileRepository
        .getUserInfo(UserAccountData.FirstName)
        .then((value) {
      debugPrint("fname $value");
      setState(() {
        firstName = value;
      });
    });
  }

  getBalance() async {
    await _profileRepository
        .checkAccountBalance(_accounts![0].bankAccountId)
        .then((value) {
      debugPrint('balance is $value');
      setState(() {
        //balance = value;
      });
    });
  }

  getAccounts() async {
    await _profileRepository.getUserBankAccounts().then((value) {
      debugPrint('Accountss### $value');

      if (value.isNotEmpty) {
        setState(() {
          _accounts = value;
        });
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //final bankAccount = widget.bankAccount;

    return AdvancedDrawer(
        backdropColor: primaryColor,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeIn,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          //Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: SafeArea(
          child: Container(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              // iconColor: Color(0xff41AE49),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 15.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      // color: Color(0xff41AE49),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      CupertinoIcons.person_alt,
                      size: 55,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Text('$_fname' + ' ' + '$_lname',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                  ), Container(
                    margin: const EdgeInsets.all(10),
                    child: Text('$_idNo',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                  ),

                  Container(
                    margin: const EdgeInsets.all(7),
                    child: Text('$_email',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.white))),
                  ),
                  // const Divider(
                  //   color: Colors.black,
                  // ),
                  // ListTile(
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => DashBoard(),
                  //     ));
                  //   },
                  //   leading: const Icon(Icons.home),
                  //   title: Text('Home',
                  //       style: GoogleFonts.inter(textStyle: const TextStyle())),
                  // ),

                  // ListTile(
                  //   onTap: () {},
                  //   leading: const Icon(Icons.account_circle_rounded),
                  //   title: Text(
                  //     'Profile',
                  //     style: GoogleFonts.inter(textStyle: const TextStyle()),
                  //   ),
                  // ),
                  // ListTile(
                  //   onTap: () {},
                  //   leading: Icon(Icons.favorite),
                  //   title: Text('Favourite Movies',
                  //       style: GoogleFonts.raleway(textStyle: TextStyle())),
                  // ),
                  // ListTile(
                  //   onTap: () {},
                  //   leading: const Icon(Icons.settings),
                  //   title: Text('Settings',
                  //       style: GoogleFonts.inter(textStyle: const TextStyle())),
                  // ),
                  const Divider(
                    color: Colors.white ,
                  ),
                  ListTile(
                    onTap: () {
                      UserAlert.showAlertDialog(context, "Logout? ",
                              isConfirm: true)
                          .then((value) {
                        if (value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ThankYou_Screen()),
                              (route) => false);
                        }
                      });
                    },
                    leading: const Icon(Icons.logout),
                    title: Text('Logout',
                        style: GoogleFonts.inter(textStyle: const TextStyle())),
                  ),
                  const Spacer(),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Text(
                        'Terms of Service | Privacy Policy',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(64.0),
              child: AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor:
                      Colors.green, //or set color with: Color(0xFF0000FF)
                ),
                flexibleSpace: Container(
                  // color: Color(0xff41AE49),
                  height: 130,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/bg_top.png'),
                          fit: BoxFit.cover)),

                  // margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _advancedDrawerController.showDrawer();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 16),
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/images/menu_white.png'),
                        ),
                      ),
                      const Spacer(),
                      Container(
                          height: 25,
                          width: 25,
                          margin: const EdgeInsets.only(right: 8),
                          child: InkWell(
                              onTap: () {
                                UserAlert.showAlertDialog(context, "Logout? ",
                                        isConfirm: true)
                                    .then((value) {
                                  if (value) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ThankYou_Screen()),
                                        (route) => false);
                                  }
                                });
                              },
                              child: Image.asset(
                                  'assets/images/logout_white.png')))
                    ],
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      // height: 400,
                      child: Stack(
                    children: [
                      Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/green_bg.png',
                                  ),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              Text(
                                '$_welcometext ',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w300)),
                              ),
                              Text(
                                '$_fname' + ' $_lname',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600)),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  'Accounts ',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300)),
                                ),
                              ),
                            ],
                          )),
                      Container(
                        // height: 161,
                        margin: const EdgeInsets.only(
                            left: 18, right: 16, top: 140),
                        child: Card(

                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        padding: EdgeInsets.only(bottom: 1),
                                        shrinkWrap: true,
                                        itemCount: snapshot.data?.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
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
                                                  // height: 50,
                                                  // width: 350,
                                                  width: MediaQuery.of(context)
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
                                                          // height: 60,
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
                                                                '  ${snapshot.data?[index].aliasName}',
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
                                                            _isLoading? const SpinKitCircle(color: Colors.green,):
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
                                                                          topLeft: Radius.circular(
                                                                              30),
                                                                          bottomLeft: Radius.circular(
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
                                                                    setState(() {
                                                                    _isLoading = true;
                                                                      showLoadingScreen.value = true;
                                                                    });
                                                                    // _isLoading? LoadUtil():
                                                                    checkMiniStatement(snapshot.data![index].bankAccountId);
                                                                  }
                                                                });
                                                              },
                                                            ),
                                                            //_isLoading? LoadUtil():
                                                            _isLoadingB? const SpinKitCircle(color: Colors.orange,):
                                                            InkWell(
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius: const BorderRadius
                                                                          .only(
                                                                      // topRight: Radius.circular(30),
                                                                      // bottomRight: Radius.circular(30)
                                                                      ),
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            10),
                                                                    width: 68,
                                                                    height: 40,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: const BorderRadius.only(
                                                                            topRight: Radius.circular(
                                                                                30),
                                                                            bottomRight: Radius.circular(
                                                                                30)),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.orange)),
                                                                    child: Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      'Balance',
                                                                      style: GoogleFonts.inter(
                                                                          textStyle: const TextStyle(
                                                                              color: Colors.orange,
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w300)),
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
                                                                      setState(() {
                                                                        _isLoadingB=true;
                                                                        showLoadingScreen.value = true;


                                                                      });
                                                                      checkBalance(snapshot.data![index].bankAccountId);
                                                                    }
                                                                  });
                                                                })
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(margin: EdgeInsets.only(top:5),
                                                child:Divider( color: Colors.black12,),)
                                              ],
                                            ),
                                          );
                                        },

                                      );
                                    }
                                    else {
                                      return const Center(
                                        child: SpinKitCircle(color: Colors.green,),
                                      ) ;
                                    }
                                  }),
                              Align(
                                // widthFactor: 2,
                                heightFactor: 0.8,
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Accounts()));
                                    },
                                    child: Container(

                                      margin: const EdgeInsets.all(
                                         9,
                                      ),
                                      child: Text(
                                        'View All Accounts   ',
                                        style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),


                      )
                    ],
                  )

                      ),

                  Container(
                    margin: const EdgeInsets.only(top: 17),
                    height: 100,
                    width: 390,
                    color: const Color(0xff0A0773BB),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 16),
                              child: Text(
                                'Frequently Accessed Items',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400)),
                              )),
                          Expanded(
                              child: Container(
                                  child: FutureBuilder(
                            future: _frequent_accessed.getAllFrequentModules(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<FrequentAccessedModule>>
                                    snapshot) {
                              debugPrint("Snapshot data${snapshot.data}");
                              Widget child =  const SpinKitCircle(color: Colors.green,);
                              if (snapshot.hasData) {
                                if (snapshot.data == []) {
                                  print('It has no data');
                                }
                                var _frequents = snapshot.data;
                                debugPrint('frequents ${_frequents}');
                                if (_frequents != null &&
                                    _frequents.isNotEmpty) {
                                  child = ListView.builder(
                                      itemCount: _frequents.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                            onTap: () {
                                              CommonUtils.navigateToRoute(
                                                widget: DynamicWidget(
                                                  favouriteModule:
                                                      _frequents[index],
                                                ),
                                                context: context,
                                              );
                                            },
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 16,
                                                    top: 25,
                                                    bottom: 20),
                                                // height: 23,
                                                //width: 150,
                                                width: 130,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    border: Border.all(
                                                        color: Colors.black12)),
                                                child: Row(children: [
                                                  CircleAvatar(
                                                    radius: 17,
                                                    child: Image.network(
                                                        _frequents[index]
                                                            .moduleUrl),
                                                  ),
                                                  Container(
                                                    constraints:
                                                        const BoxConstraints(
                                                            maxWidth: 160),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Text(
                                                      _frequents[index]
                                                          .moduleName,
                                                      style: GoogleFonts.inter(
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      16)),
                                                    ),
                                                  )
                                                ])));
                                        // Card(
                                        //   child: Text(_frequents[index].moduleName),
                                        // );
                                      });
                                }
                              }
                              return child;
                            },
                          )))
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16, top: 30),
                    child: Text(
                      //textAlign: TextAlign.left,
                      'Transactions',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 460,
                    // height: MediaQuery.of(context).size.height,
                    // height: MediaQuery.of(context).size.height,

                    child:


                    FutureBuilder<List<ModuleItem>>(
                      future: _homeRepository.getMainModules(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<ModuleItem>> snapshot) {
                        Widget child=
                        const SpinKitCircle(color: Colors.green,);

                        if (snapshot.hasData) {


                         child= GridView.builder(

                          padding:
                          const EdgeInsets.symmetric(horizontal: 12),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data?.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 7,
                              childAspectRatio: 16 / 24,
                              mainAxisSpacing: 20),
                          itemBuilder: (BuildContext context, int index) {
                            WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                              setState(() {
                                _enabled= false;
                              });
                            });

                            return ModuleItemWidget(

                                moduleItem: snapshot.data![index]);

                          },


                        );;

                          var moduleItems = snapshot.data;
                          // if (moduleItems != null && moduleItems.isNotEmpty) {
                          //
                          //   child =
                          // }

                        }
                        return  child;

                      },

                    ),
                  ),
                ],
              ),
            )));
  }



  checkMiniStatement(String accountNumber) {

    _profileRepository.checkMiniStatement(accountNumber).then((value) {
      setState(() {
        _isLoading = false;
      });
      debugPrint('accNum$accountNumber');
      if (value?.status == StatusCode.success.statusCode) {
            Utils.navigateToScreen(
                context, MiniStatement(ministatement: value?.accountStatement));
          } else {
            UserAlert.showAlertDialog(context, value?.message ?? "Error");
          }

      });

  }
  checkBalance(String accountNumber){
    _profileRepository.checkAccountBalance(accountNumber).then((value) {
      setState(() {
        _isLoadingB= false;
      });
      if(value?.status==StatusCode.success.statusCode){
        UserAlert.showAlertDialog(context, 'Your Account balance is $value');
      } else{
        UserAlert.showAlertDialog(context, value?.message?? "Error");
      }

    });
  }
}
