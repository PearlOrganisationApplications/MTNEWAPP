import 'dart:async';

import 'package:Mantenatal/newApp/home/startinappflow/showScrreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../Constant/App Color/constant.dart';
import '../widget/app_button.dart';
import '../widget/bottomsheet.dart';

class HomeNew extends StatefulWidget {
  const HomeNew({Key? key}) : super(key: key);

  @override
  State<HomeNew> createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> {
  var odd;

  ///***  Create a business Logic For Timer.
  int? indx = 0;
  int second = 0, minutes = 0;
  int? count = 0;

  String digitSecond = "00", digitMin = "00";
  Timer? timer;
  bool started = false;
  bool isloading = false;
  DateTime? startTime, endTime;

  bool slight = false;
  bool mild = false;
  bool moderate = false;
  bool strong = false;
  bool intense = false;

  int startIndex = 0;

  List laps = [];

  ///*** Create function  To Stop Timer

  void stopTimer() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  ///*** Create Function to Clear  Timer

  void Reset() {
    timer!.cancel();
    setState(() {
      second = 0;
      minutes = 0;

      digitSecond = "00";
      digitMin = "00";
      started = false;
    });
  }

  //*** Now We Going To Create Function For Laps

  void addLaps() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var min = preferences.getString('digitMin');
    var sec = preferences.getString('digitSecond');

    String lap = "$min:$sec";
    setState(() {
      laps.add(lap);
    });
  }

  //*** Now We Going To Create Function For Start Timer.

  void startTimer() {
    started = true;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      int localSecond = second + 1;
      int localMintues = minutes;
      if (localSecond == 15) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ShowScreen()),
        );
      }

      if (localSecond > 59) {
        localMintues++;
        localSecond = 0;
      }
      setState(() {
        second = localSecond;
        minutes = localMintues;
        digitSecond = (second >= 10) ? "$second" : "0$second";
        digitMin = (second >= 10) ? "$minutes" : "0$minutes";

        indx = laps.length;
        slight = false;
        mild = false;
        moderate = false;
        strong = false;
        intense = false;
      });
      SharedPreferences secpref = await SharedPreferences.getInstance();
      secpref.setString('digitSecond', digitSecond);
      SharedPreferences minpref = await SharedPreferences.getInstance();
      secpref.setString('digitMin', digitMin);
    });
  }

  TimeOfDay? avgTime() {
    if (startTime != null && endTime != null) {
      final difference = endTime!.difference(startTime!).inMinutes;

      final result = startTime!.add(Duration(minutes: difference ~/ 2));
      return TimeOfDay.fromDateTime(result);
    }
  }

  // void autoPress(){
  //   timer = Timer( Duration(seconds:15),(){
  //     Timer.periodic( Duration(seconds: 15), (Timer t) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ShowScreen()),),);
  //    print("This line will print after two seconds");
  //   });
  // }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                  0.0
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
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image.asset("assets/images/logob.png"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$digitMin:$digitSecond",
                        style: GoogleFonts.lato(
                            fontSize: 20, color: Colors.white)),
                  ],
                ),
                timeConterner()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget timeConterner() {
    int selectedIndex = 0;
    int gottenStars = 4;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 415,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xff1E1E1E)),
            child: ListView.builder(
                itemCount: laps.length,
                itemBuilder: (context, index) {
                  //indx = int.parse(laps[index]);
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 15.w,
                      height: 9.25.h,
                      child: Dismissible(
                        key: Key(laps[index]),
                        onDismissed: (direction) async {
                          setState(() {
                            index = laps[index];

                            laps.removeAt(index);
                          });
                        },
                        child: Card(
                          semanticContainer: false,
                          color: Colors.white,
                          elevation: 7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Contraction :#${index + 1}",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: index.isOdd
                                            ? Colors.black
                                            : Colors.black)),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${laps[index]}",
                                        style: TextStyle(
                                            color: index.isOdd
                                                ? Colors.black
                                                : Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 2.0,
                                      ),
                                      SmoothStarRating(
                                          allowHalfRating: false,
                                          onRated: (v) {},
                                          starCount: 5,
                                          rating: slight
                                              ? 1
                                              : mild
                                                  ? 2
                                                  : moderate
                                                      ? 3
                                                      : strong
                                                          ? 4
                                                          : intense
                                                              ? 5
                                                              : 0,
                                          size: 15.0,
                                          isReadOnly: true,
                                          filledIconData: Icons.circle,
                                          halfFilledIconData: Icons.star_half,
                                          color: AppColors.fuchsiaPink,
                                          borderColor: Colors.white,
                                          spacing: 0.0),
                                    ],
                                  )
                                  // : mild
                                  //                               ? Column(
                                  //                                   children: [
                                  //                                     Text(
                                  //                                       "${laps[index]}",
                                  //                                       style: TextStyle(
                                  //                                           color: index.isOdd
                                  //                                               ? Colors.black
                                  //                                               : Colors.black),
                                  //                                     ),
                                  //                                   ],
                                  //                                 )
                                  //                               : Text(
                                  //                                   "${laps[index]}",
                                  //                                   style: TextStyle(
                                  //                                       color: index.isOdd
                                  //                                           ? Colors.black
                                  //                                           : Colors.black),
                                  //                                 ),
                                  ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (!started)
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isloading = true;
                        });
                        Vibration.vibrate(duration: 100);
                        startTimer();
                        setState(() {
                          isloading = false;
                        });
                      },
                      child: Container(
                        width: 300,
                        height: 38,
                        decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: isloading
                              ? CircularProgressIndicator()
                              : Text(
                                  "Start Tracker",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        Vibration.vibrate(duration: 100);
                        Reset();

                        builddialog(context);
                      },
                      child: Container(
                        width: 300,
                        height: 38,
                        decoration: BoxDecoration(
                            color: AppColors.textColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Interval",
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppColors.buttonColor),
                          ),
                        ),
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }

  Future builddialog(BuildContext context) {
    return showGeneralDialog(
      barrierLabel: "Label",
      // barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 320,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "Select Intensity",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (indx == laps.length) {
                      setState(() {
                        slight = true;
                        count = 1;
                        addLaps();
                        Reset();
                      });
                    }
                  },
                  child: const Text(
                    "Slight",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  height: 1.5,
                  color: Colors.black,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (indx == laps.length) {
                      setState(() {
                        mild = true;
                        count = 2;
                        addLaps();
                      });
                    }
                  },
                  child: const Text(
                    "Mild",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  height: 1.5,
                  color: Colors.black,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (indx == laps.length) {
                      setState(() {
                        moderate = true;
                        count = 3;
                        addLaps();
                      });
                    }
                  },
                  child: const Text(
                    "Moderate",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  height: 1.5,
                  color: Colors.black,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (indx == laps.length) {
                      setState(() {
                        strong = true;
                        count = 4;
                        addLaps();
                      });
                    }
                  },
                  child: const Text(
                    "Strong",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  height: 1.5,
                  color: Colors.black,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (indx == laps.length) {
                      setState(() {
                        intense = true;
                        count = 5;
                        addLaps();
                      });
                    }
                  },
                  child: const Text(
                    "Intense",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }
}
