import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Constant/App Color/constant.dart';
import '../../MVVM/ApiRoutes.dart';
import '../../MVVM/Model/Name_Model.dart';
import '../../MVVM/viweModel/nameScreen.dart';
import '../bottombar.dart';
import '../homeNew.dart';

class NameScreen extends StatefulWidget {
  final String name;
  NameScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  DateTime _dateTime = DateTime.now();

  _dateString() {
    if (_dateTime == null) {
      return "Please choose a date .";
    } else {
      return "${_dateTime.day}- ${_dateTime.month}-${_dateTime.year}";
    }
  }

  final textEditingController = TextEditingController();

  List<Name> nameModel = [];

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Hello ',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: AppColors.buttonColor)),
                  TextSpan(
                    text: widget.name.toString(),
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 43,
                        color: AppColors.buttonColor),
                  ),
                ],
              ),
            ),
            Text(
              "BE THE BEST DAD YOU CAN BE",
              style: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   padding: EdgeInsets.only(left: 12),
                    //   width: double.infinity,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(5),
                    //     border: Border.all(
                    //       color: Colors.black,
                    //       width: 1,
                    //     ),
                    //   ),
                    //   child: TextFormField(
                    //     controller: textEditingController,
                    //     decoration: const InputDecoration(
                    //       hintText: "Type your baby name",
                    //       border: InputBorder.none,
                    //       fillColor: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Text(
                    //   "OR ",
                    //   style: GoogleFonts.lato(
                    //       fontSize: 24,
                    //       fontWeight: FontWeight.w400,
                    //       color: AppColors.buttonColor),
                    // ),
                    Text(
                      "When is your baby due  ",
                      style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: AppColors.buttonColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MaterialButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                      context: context,
                                      initialDate: _dateTime,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2025))
                                  .then((value) {
                                setState(() {
                                  _dateTime = value!;
                                });
                              });
                            },
                            child: Text(
                              "${_dateTime.day}- ${_dateTime.month}-${_dateTime.year}",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: AppColors.textColor),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    MaterialButton(
                      onPressed: () {
                        ApiServices().apiCallLogin(
                            name: widget.name,
                            age: 'ABC',
                            date: _dateTime.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomBar(
                              token: '',
                              name: widget.name,
                              babyname: textEditingController.text,
                              age: _dateTime.toString(),
                            ),
                          ),
                        );
                        print(widget.name);
                        print(textEditingController.text);
                        print(_dateTime);
                      },
                      child: Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text(
                          "Next",
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
