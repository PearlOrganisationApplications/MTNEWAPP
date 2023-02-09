
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


import '../../../Constant/App Color/constant.dart';
import 'ageScreen.dart';


class NameScrreen extends StatefulWidget {
  const NameScrreen({Key? key}) : super(key: key);

  @override
  State<NameScrreen> createState() => _NameScrreenState();
}

class _NameScrreenState extends State<NameScrreen> {
  final _formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();
  // TextEditingController? textEditingController;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/gb.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Container(
                    padding:EdgeInsets.only(left:12),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white
                          ,borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),

                    ),
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText:"Type your name here...",
                        border:InputBorder.none,
                        fillColor:Colors.white,
                      ),
                    ),

                    ),
                SizedBox(height: 60,),
                MaterialButton(
                  onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>   NameScreen(
                          name: textEditingController.text,


                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor
                          ,borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(child: Text("Next",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black),)),
                  ),
                ),
                SizedBox(height: 19,),
                Text("By continuing you are agree to our ",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textColor),)
                ,Text("Privacy Policy and Terms & Conditions   ",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textColor),)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ScreenArguments {
  final String contact;
  final String name;

  ScreenArguments({required this.contact, required this.name});
}