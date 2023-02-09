import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sizer/sizer.dart';

import '../../Constant/App Color/constant.dart';
import '../widget/app_button.dart';


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
    if (startTime  != null && endTime != null) {
      final difference = endTime!.difference(startTime!).inMinutes;

      final result = startTime!.add(Duration(minutes: difference ~/ 2));
      return TimeOfDay.fromDateTime(result);
    }
  }
  bool slight = false;
  bool mild = false;
  bool strong = false;


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
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10 ,),
                Center(child: Image.asset("assets/images/logob.png"),),
                const SizedBox(height: 10 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:   [
                   Text("$digitMin:$digitSecond",style: GoogleFonts.lato(fontSize: 20,color: Colors.white)),

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
  Widget timeConterner(){
    int selectedIndex=0;
    int gottenStars=4;


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              width: double.infinity,
            height: 347,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
                  color: Color(0xff1E1E1E)
            ),
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
                        onDismissed: (direction){
                          setState(() {
                            laps.removeAt(index);
                          });
                        },

                        child: Card(
                          semanticContainer: false,
                            color: Colors.white,

                          elevation: 7,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Contraction intensity:${index + 1}",
                                    style: TextStyle(
                                        fontSize:15.sp,
                                        color: index.isOdd
                                            ? Colors.black
                                            :  Colors.black)),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: slight? Column(
                                    children: [
                                      Text(
                                        "${laps[index]}",
                                        style: TextStyle(
                                            color: index.isOdd
                                                ? Colors.black
                                                : Colors.black),
                                      ),
                                      const Icon(Icons.star,color: Colors.white,),
                                    ],
                                  ): mild ? Column(
                                    children: [
                                      Text(
                                        "${laps[index]}",
                                        style: TextStyle(
                                            color: index.isOdd
                                                ? Colors.black
                                                : Colors.black),
                                      ),

                                    ],
                                  ):
                                  Text(
                                    "${laps[index]}",
                                    style: TextStyle(
                                        color: index.isOdd
                                            ? Colors.black
                                            : Colors.black),
                                  )

                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 45,),
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 // Wrap(
                 //   children:  List.generate(5, (index){
                 //     return InkWell(
                 //
                 //       onTap: (){
                 //         setState(() {
                 //           selectedIndex =index;
                 //           print("${index}");
                 //
                 //         });
                 //       },
                 //       child: Container(
                 //         margin: const EdgeInsets.only(right: 10),
                 //         child: AppButton(
                 //           color: selectedIndex ==index?Colors.black:Colors.blue,
                 //           size:50 ,
                 //
                 //           backgroundColor:selectedIndex ==index?Colors.pinkAccent:Colors.white ,
                 //           borderColor:selectedIndex ==index?Colors.black:AppColors.buttonColor,
                 //           text: (index+1).toString(),),
                 //       ),
                 //     );
                 //   })
                 // )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (!started) ?  InkWell(
                onTap: (){
                  (!started) ? startTimer() : stopTimer();

                },
                child: Container(
                  width: 300,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColors.buttonColor
                        ,borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(child: Text("Start Tracker",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.black),)),
                ),
              ):InkWell(
                onTap: (){
                  addLaps();
                  Reset();
                },
                child: Container(
            width: 300,
            height: 38,
            decoration: BoxDecoration(
                  color: AppColors.textColor
                  ,borderRadius: BorderRadius.circular(12)
            ),
            child: Center(child: Text("Interval",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: AppColors.buttonColor),)),
          ),
              ),
              // Container(
              //   width: 155,
              //   height: 38,
              //   decoration: BoxDecoration(
              //       color: AppColors.textColor
              //       ,borderRadius: BorderRadius.circular(12)
              //   ),
              //   child: Center(child: Text("Stop Tracker",style: GoogleFonts.lato(fontWeight: FontWeight.w700,color: AppColors.buttonColor),)),
              // )
            ],
          )
        ],
      ),
    );
  }
}
