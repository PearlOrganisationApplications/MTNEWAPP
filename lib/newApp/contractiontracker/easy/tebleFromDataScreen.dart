import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../Constant/App Color/constant.dart';
import '../../MVVM/Model/ViweTable.dart';
import '../../MVVM/viweModel/ViweTebleModel.dart';


class TableDataFrom extends StatefulWidget {
  const TableDataFrom({Key? key}) : super(key: key);

  @override
  State<TableDataFrom> createState() => _TableDataFromState();
}

class _TableDataFromState extends State<TableDataFrom> {
  @override
  void initState() {
    ApiServicesApp().apiCallTaskLogin();

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
              image: AssetImage("assets/images/gb.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, stops: const [
                0.0,
                0.9
              ], colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.0)
              ]),

            ),
            child: FutureBuilder<ViweTeble>(

               future: ApiServicesApp().apiCallTaskLogin(),
              builder: (context, snapshot) {
                if (!snapshot.hasData){

                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.task!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                        child: Column(
                          children: [
                            Text(snapshot.data!.task![index].createdAt.toString(),style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w700,color: AppColors.textColor),),
                            const SizedBox(height: 20,),
                            Container(

                              width: double.infinity,
                              height: 300,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(38),
                                gradient: LinearGradient(begin: Alignment.bottomRight, stops: const [
                                  0.0,
                                  0.0
                                ], colors: [
                                  Colors.white.withOpacity(.1),
                                  Colors.white.withOpacity(.1)
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
                                        Text("EAT",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w700,color: AppColors.textColor),),
                                        const SizedBox(width: 52,),
                                        Text("02:40(15)",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w700,color: AppColors.buttonColor))
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.black,
                                    ),
                                    const SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        Text("Activity",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w700,color: AppColors.buttonColor)),
                                        const SizedBox(width: 52,),
                                        Text("02:40(15)",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w700,color: AppColors.textColor))
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.black,
                                    ),
                                    const SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        Text("SLEEP",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w700,color: AppColors.textColor)),
                                        const SizedBox(width: 52,),
                                        Text("02:40(15)",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w700,color: AppColors.buttonColor))
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.black,
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Text("YOU",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w700,color: AppColors.buttonColor)),
                                        const SizedBox(width: 52,),
                                        Text("02:40(15)",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w700,color: AppColors.textColor))
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
              } return Container();
               }
            ),

          ),
        ),
      ),
    );
  }
}
