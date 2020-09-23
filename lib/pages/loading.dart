import 'package:flutter/material.dart';
import 'package:worldclock/services/World_Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setWorldTime() async {
    WorldTime instance = WorldTime(location:'KolKata',flag: 'Flag_of_India.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
    
  }

  @override
  void initState() {
  super.initState();
  setWorldTime();   
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitSquareCircle(
          color: Colors.deepOrange,
          size: 200.0,
          ),
      ),
    );
  }
}