import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Constant/App Color/constant.dart';
import '../contractiontracker/Discord.dart';
import 'homeNew.dart';


class LinkScreen extends StatefulWidget {
  const LinkScreen({Key? key}) : super(key: key);

  @override
  State<LinkScreen> createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/gb.png"),
              fit: BoxFit.cover,
            ),

          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(child: Image.asset("assets/images/logob.png" ),),
              ),
              const Spacer(),

              Container(
                width: double.infinity,
                height: 468,
                decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                      0.0,
                      0.9
                    ], colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0)
                    ]),

                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>   const HomeNew()),
                          );

                        },
                        child: Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.black
                                ,borderRadius: BorderRadius.circular(12),
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
                                  Icon(Icons.alarm,color: AppColors.textColor,),
                                  const SizedBox(width: 20,),
                                  Text("Contraction tracker",style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 15,color: AppColors.textColor),)
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios,color: AppColors.textColor,)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.black
                            ,borderRadius: BorderRadius.circular(12),
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
                                 Image.asset("assets/images/easyb.png"),
                                const SizedBox(width: 20,),
                                Text("EASY                             ",style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 15,color: AppColors.buttonColor),)
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,color: AppColors.buttonColor,)
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>   const Discord_Scrren(),
                          ),
                        );
                      },
                        child: Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.black
                              ,borderRadius: BorderRadius.circular(12),
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
                                  const SizedBox(width: 23,),
                                  Text("Join our Discord ",style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 15,color: const Color(0xff5865F2)),)
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios,color:Color(0xff5865F2) ,)
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
          )


        ),
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