import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async{
    WorldTime instance = WorldTime('Africa/Khartoum','Khartoum','sudan');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      'time':instance.time,
      'location':instance.location,
      'flag':instance.flag,
      'isDaytime': instance.isDaytime
    });



  }


  @override
  initState(){

    super.initState();
    setupWorldTime();



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child:SpinKitPouringHourGlassRefined(
          color: Colors.white,
          size: 80.0,
        ),

      )
    );
  }
}
