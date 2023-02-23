import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Constant/App Color/constant.dart';
import '../../MVVM/Model/ViweTable.dart';
import '../../MVVM/viweModel/ViweTebleModel.dart';

class TableDataFrom extends StatefulWidget {
  const TableDataFrom({Key? key}) : super(key: key);

  @override
  State<TableDataFrom> createState() => _TableDataFromState();
}

class _TableDataFromState extends State<TableDataFrom> {
  String? data;
  @override
  void initState() {
    ApiServicesApp.apiCallTaskLogin();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.buttonColor,
      // ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              // gradient: LinearGradient(
              //     begin: Alignment.bottomRight,
              //     stops: const [
              //       0.0,
              //       0.9
              //     ],
              //     colors: [
              //       Colors.black.withOpacity(.8),
              //       Colors.black.withOpacity(.5)
              //     ]),
            ),
            child: FutureBuilder<ViweTeble>(
                future: ApiServicesApp.apiCallTaskLogin(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return   Center(
                        child:  CircularProgressIndicator(color: AppColors.buttonColor,) ,
                      );
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.task!.length??0,
                          itemBuilder: (BuildContext context, int index) {
                            int itemCount = snapshot?.data!.task!.length ?? 0;
                            int reversedIndex = itemCount - 1 - index;
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 20, bottom: 20),
                              child: Column(
                                children: [
                                  Text(
                                    snapshot.data!.task![reversedIndex].day.toString(),
                                    style: GoogleFonts.lato(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(38),
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          stops: const [
                                            0.0,
                                            0.0
                                          ],
                                          colors: [
                                            Colors.black.withOpacity(.3),
                                            Colors.black.withOpacity(.3)
                                          ]),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Column(
                                        children: [
                                          // Text("BIRTH - the first few day @home",style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 20),
                                          //     ),

                                          Row(
                                            children: [
                                              Text(
                                                "EAT",
                                                style: GoogleFonts.lato(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.textColor),
                                              ),
                                              const SizedBox(
                                                width: 52,
                                              ),
                                              Text(snapshot.data!.task![reversedIndex].eat.toString(),
                                                  style: GoogleFonts.lato(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors
                                                          .buttonColor))
                                            ],
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Text("ACTIVITY",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors
                                                          .buttonColor)),
                                              const SizedBox(
                                                width: 52,
                                              ),
                                              Text(snapshot.data!.task![reversedIndex].activity.toString(),
                                                  style: GoogleFonts.lato(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.textColor))
                                            ],
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Text("SLEEP",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.textColor)),
                                              const SizedBox(
                                                width: 52,
                                              ),
                                              Text(snapshot.data!.task![reversedIndex].sleep.toString(),
                                                  style: GoogleFonts.lato(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors
                                                          .buttonColor))
                                            ],
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text("YOU",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors
                                                          .buttonColor)),
                                              const SizedBox(
                                                width: 52,
                                              ),
                                              Text(snapshot.data!.task![reversedIndex].you.toString(),
                                                  style: GoogleFonts.lato(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.textColor))
                                            ],
                                          ),

                                          const Divider(
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                  }
                  return Container();
                }),
          ),
        ),
      ),
    );
  }
}
