import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Constant/App Color/constant.dart';
import '../../Constant/App Keys/app_key.dart';
import '../MVVM/ApiRoutes.dart';
import '../MVVM/Model/table.dart';
import '../MVVM/viweModel/fatherhoodViweModel.dart';
import 'easy/tebleFromDataScreen.dart';
import 'package:http/http.dart' as http;

class FatherHood extends StatefulWidget {
  final String token ;
    FatherHood({Key? key,  required this.token}) : super(key: key);

  @override
  State<FatherHood> createState() => _FatherHoodState();
}

class _FatherHoodState extends State<FatherHood> {

  TextEditingController eatInput = TextEditingController();
  TextEditingController activityInput = TextEditingController();
  TextEditingController sleepInput = TextEditingController();
  TextEditingController youInput = TextEditingController();
  var user_id = '';
  var eat ='';
  var sleep ='';
   var activity ='';
   var you='';
   var token='';









  bool isloading = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  BoxDecoration(

          gradient: LinearGradient(begin: Alignment.bottomRight, stops: const [
            0.8,
            0.8
          ], colors: [
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(.8)
          ]),
          image: const DecorationImage(
            image: AssetImage("assets/images/gb.png"),
            fit: BoxFit.cover,
          ),

        ),
        child: Column(
          children: [
      //   Padding(
      //   padding: const EdgeInsets.only(top: 30),
      //   child: Center(child: Image.asset("assets/images/newlogoo.png"),),
      // ),
      const Spacer(),

      Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          // gradient: LinearGradient(begin: Alignment.bottomRight, stops: const [
          //   0.0,
          //   0.9
          // ], colors: [
          //   Colors.black.withOpacity(.8),
          //   Colors.black.withOpacity(.0)
          // ]),

        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text("EAT",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: AppColors.buttonColor),


                ),
                Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),

                    border: Border.all(
                        color: AppColors.buttonColor,
                        width: 2.0,
                        style: BorderStyle.solid), //Border.all


                  ),
                  child: TextFormField(
                    controller: eatInput,
                    decoration: const InputDecoration(
                      // hintText:"Type your name here...",
                      border:InputBorder.none,
                      fillColor:Colors.white,
                    ),
                  ),
                ),
                Text("ACTIVITY",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: AppColors.textColor),


                ),
                Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),

                    border: Border.all(
                        color: AppColors.buttonColor,
                        width: 2.0,
                        style: BorderStyle.solid), //Border.all


                  ),
                  child: TextFormField(
                    controller: activityInput,
                    decoration: const InputDecoration(
                      // hintText:"Type your name here...",
                      border:InputBorder.none,
                      fillColor:Colors.white,
                    ),
                  ),
                ),
                Text("SLEEP",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: AppColors.buttonColor),


                ),
                Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),

                    border: Border.all(
                        color: AppColors.buttonColor,
                        width: 2.0,
                        style: BorderStyle.solid), //Border.all


                  ),
                  child: TextFormField(
                    controller: sleepInput,
                    decoration: const InputDecoration(
                      // hintText:"Type your name here...",
                      border:InputBorder.none,
                      fillColor:Colors.white,
                    ),
                  ),
                ),
                Text("YOU",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: AppColors.textColor),


                ),
                Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),

                    border: Border.all(
                        color: AppColors.buttonColor,
                        width: 2.0,
                        style: BorderStyle.solid), //Border.all


                  ),
                  child: TextFormField(
                    controller: youInput,
                    decoration: const InputDecoration(
                      // hintText:"Type your name here...",
                      border:InputBorder.none,
                      fillColor:Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Center(
                  child: MaterialButton(

                    onPressed: (){
                      ApiServices().apiCallLogin( eat: eatInput.text.toString(), sleep: sleepInput.text.toString(), activity: activityInput.text.toString(), you: youInput.text.toString());

                      Navigator.push(context,MaterialPageRoute(builder: (context)=>const TableDataFrom()), );
                    },
                    child: Container(
                      width: 200,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(12),

                        border: Border.all(
                            color: AppColors.buttonColor,
                            width: 2.0,
                            style: BorderStyle.solid), //Border.all


                      ),
                      child: Center(child: Text("SUBMIT",style: GoogleFonts.lato(fontWeight: FontWeight.w900,fontSize: 20,color: Colors.black),)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

              ],
            ),
          ),
        ),
      )
          ],
        ),
      ),
    );
  }
}
