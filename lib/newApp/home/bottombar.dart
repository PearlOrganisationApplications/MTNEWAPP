import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import '../contractiontracker/Discord.dart';
import '../contractiontracker/fatherhoodEASY.dart';
import '../contractiontracker/webMantenatal.dart';
import 'homeNew.dart';
import 'linkScreeen.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/src/services/haptic_feedback.dart';

class BottomBar extends StatefulWidget {
  final String token;
  final String name ,babyname,age;

  const BottomBar({Key? key, required this.token, required this.name, required this.babyname, required this.age}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentTab = 0;
  var name ;
  var babyname;
  var age;

  @override
  void initState() {
    name =widget.name;
    babyname=widget.babyname;
    age =widget.age;
    super.initState();
  }

  final List<Widget> screens = [
     LinkScreen( name:  "", babyname:"", age:""),
    const HomeNew(),
    FatherHood(
      token: "",
    ),
    const Discord_Scrren(),
  ];
  Widget currentScreen =   LinkScreen( name: "", babyname: "", age: "");

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        height: 62,
        width: 62,
        child: FloatingActionButton(

          onPressed: () {
            Vibration.vibrate(duration: 100);
            // _AppWebWight()
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WebMan()));
          },
          elevation: 10,
          mini: true,
          child: Image.asset(
            "assets/images/logoapp.png",
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        color: const Color(0xffFFC0CB),
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: MaterialButton(

                          onPressed: () {
                            Vibration.vibrate(duration:  100);
                            setState(() {
                              currentScreen =   LinkScreen(name: widget.name, babyname: widget.babyname.toString(), age: widget.age.toString(),);
                              currentTab = 0;
                            });
                          },
                          child: const Icon(
                            Icons.home,
                          )),
                    ),
                    MaterialButton(
                        onPressed: () {
                          setState(() {
                            Vibration.vibrate(duration: 100);
                            currentScreen = const HomeNew();
                            currentTab = 1;
                          });
                        },
                        child: const Icon(Icons.alarm)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MaterialButton(
                        onPressed: () {
                          setState(() {
                            Vibration.vibrate(duration: 100);
                            currentScreen = FatherHood(
                              token: '',
                            );
                            currentTab = 2;
                          });
                        },
                        child: Image.asset(
                          "assets/images/eaysa.png",
                          width: 30,
                          height: 30,
                        )),
                    MaterialButton(
                        onPressed: () {
                          setState(() {
                            Vibration.vibrate(duration: 100);
                            currentScreen = const Discord_Scrren();
                            currentTab = 3;
                          });
                        },
                        child: Image.asset("assets/images/imagea.png",
                            width: 30, height: 30))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://linktr.ee/mantenatal';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
