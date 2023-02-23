import 'dart:async';
import 'dart:convert';

import 'package:Mantenatal/newApp/MVVM/Model/class_Name.dart';
import 'package:Mantenatal/newApp/MVVM/viweModel/homePage.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Constant/App Color/constant.dart';
import '../contractiontracker/Discord.dart';
import '../contractiontracker/easy/tebleFromDataScreen.dart';
import 'homeNew.dart';
import 'package:http/http.dart' as http;

class LinkScreen extends StatefulWidget {
  final String name, babyname, age;

  const LinkScreen(
      {Key? key, required this.name, required this.babyname, required this.age})
      : super(key: key);

  @override
  State<LinkScreen> createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen> {
  @override
  void initState() {
    // TODO: implement initState
    ApiServicesAppp.apiCallUserLogin();
    super.initState();
  }

  StreamController<NameModel> _streamController = StreamController();

  @override
  void dispose() {
    _streamController.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  stops: const [
                    0.0,
                    0.9
                  ],
                  colors: [
                    Colors.white.withOpacity(.8),
                    Colors.black.withOpacity(.5)
                  ]),
              image: const DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text("Hello",
                          style: GoogleFonts.lato(
                              fontSize: 30, color: AppColors.buttonColor)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(widget.name,
                          style: GoogleFonts.lato(
                              fontSize: 45, color: AppColors.skyColor))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: Image.asset("assets/images/logob.png"),
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  height: 468,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeNew()),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: AppColors.buttonColor,
                                  width: 1.0,
                                  style: BorderStyle.solid), //Border.all
                            ), //BoxDecora

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.alarm,
                                      color: AppColors.white,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "     Contraction Tracker",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color: AppColors.white),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TableDataFrom()),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: AppColors.buttonColor,
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/dary.png"),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      " EASY                             ",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color: AppColors.white),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Discord_Scrren(),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: AppColors.buttonColor,
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/imagea.png"),
                                    const SizedBox(
                                      width: 23,
                                    ),
                                    Text("Join our Discord ",
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color: AppColors.white,
                                        )),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

_launchDiscordURL() async {
  const url = 'https://discord.com/invite/UXK8rUs3Tx';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
