import 'package:Mantenatal/Constant/App%20Color/constant.dart';
import 'package:flutter/material.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackPearl,
        title: Text("HELP"),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: const [
                  0.0,
                  0.9
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
          child: Column(
    children: [],
    )
    ));
  }
}
