import 'dart:async';

import 'package:Mantenatal/newApp/home/startinappflow/showScrreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sizer/sizer.dart';

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

  int second = 0, minutes = 0;

  String digitSecond = "00", digitMin = "00";
  Timer? timer;
  bool started = false;
  DateTime? startTime, endTime;

  int startIndex =0;

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

  void addLaps() {
    String lap = "$digitMin:$digitSecond";
    setState(() {
      laps.add(lap);
    });
  }

  //*** Now We Going To Create Function For Start Timer.

  void startTimer() {
    started = true;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
      });
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
  bool slight = false;
  bool mild = false;
  bool strong = false;
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
            height: 347,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xff1E1E1E)),
            child: ListView.builder(
                itemCount: laps.length,
                itemBuilder: (context, index) {
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
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.setInt('index', laps[index]);
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
                                  child: slight
                                      ? Column(
                                          children: [
                                            Text(
                                              "${laps[index]}",
                                              style: TextStyle(
                                                  color: index.isOdd
                                                      ? Colors.black
                                                      : Colors.black),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                          ],
                                        )
                                      : mild
                                          ? Column(
                                              children: [
                                                Text(
                                                  "${laps[index]}",
                                                  style: TextStyle(
                                                      color: index.isOdd
                                                          ? Colors.black
                                                          : Colors.black),
                                                ),
                                              ],
                                            )
                                          : Text(
                                              "${laps[index]}",
                                              style: TextStyle(
                                                  color: index.isOdd
                                                      ? Colors.black
                                                      : Colors.black),
                                            )),
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
                        (!started) ? startTimer() : stopTimer();
                      },
                      child: Container(
                        width: 300,
                        height: 38,
                        decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text(
                          "Start Tracker",
                          style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        )),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        addLaps();
                        Reset();
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => buildSheet());
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
                        )),
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildSheet() {
    return DraggableScrollableSheet(builder: (_, controller) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          controller: controller,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
                child: Text(
              "Select Intensity",
              style: TextStyle(fontSize: 20),
            )),
            const SizedBox(
              height: 40,
            ),
            TextButton(
                onPressed: () {

                },
                child: const Text(
                  "Slight",
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Mild",
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Moderate",
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Strong",
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {

                },
                child: const Text(
                  "Intense",
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      );
    });
  }
}
