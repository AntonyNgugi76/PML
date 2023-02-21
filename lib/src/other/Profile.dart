import 'package:craft_dynamic/craft_dynamic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _profileRepo = ProfileRepository();
  String ? _fname;
  String? _lname;
  String? _phone;
  String? _email;
  String? _photo;

  getfName() async{
    await _profileRepo.getUserInfo(UserAccountData.FirstName).then((value){
      setState(() {
        _fname=value;
      });
    });
  }
  getlName() async{
    await _profileRepo.getUserInfo(UserAccountData.LastName).then((value){
      setState(() {
        _lname=value;
      });
    });
  }  getPhoto() async{
    await _profileRepo.getUserInfo(UserAccountData.ImageUrl).then((value){
      setState(() {
        _photo=value;
      });
    });
  }
  getPhone() async{
    await _profileRepo.getUserInfo(UserAccountData.LastLoginDateTime).then((value){
      setState(() {
        _phone=value;
      });
    });
  }
  getEmail() async{
    await _profileRepo.getUserInfo(UserAccountData.EmailID).then((value){
      setState(() {
        _email=value;
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
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          // margin: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash_bg.png'), fit: BoxFit.fill)),
            child: Container(
                margin: EdgeInsets.all(16),
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
                        margin: EdgeInsets.only(top: 50, right: 0),
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/icons/ex.png'))),

                Container(
                  margin: EdgeInsets.only( top: 20),
                  child: Text(
                    'Your basic information',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 78,
                      width: 78,
                      margin: EdgeInsets.only(top: 31, left: 0),
                      child: CircleAvatar(
                        backgroundColor: Colors.black45,
                        child: Image.network('$_photo'),
                      ),
                    ),
                    Container(
                      height: 78,
                      width: 78,
                      margin: EdgeInsets.only(top: 31, right: 0),
                      child: Image.asset('assets/icons/plus.png')
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children:[
                    Text(
                      '$_fname'' ' '$_lname',style: GoogleFonts.inter(
                    textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ))
                    ),
                      Text(
                          textAlign: TextAlign.center,'Full Names',style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300, color: Colors.orange
                          ))
                      )
                    ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,


                      children:[
                        Text(
                            '$_phone',style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ))
                        ),
                        Text(
                            textAlign: TextAlign.left,'Saved Phone Number',style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300, color: Colors.green
                            ))
                        )
                      ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children:[
                        Text(
                            '$_email',style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ))
                        ),
                        Text(
                            textAlign: TextAlign.left,'Saved Email Address',style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300, color: Colors.blue
                            ))
                        )
                      ]
                  ),
                )
              ],
            ))));
  }
}
