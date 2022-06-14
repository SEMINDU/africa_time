import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   var data;

  @override
  Widget build(BuildContext context) {

    data =data == null? ModalRoute.of(context)?.settings.arguments:data;


    //set background
    String bgImage = data['isDaytime']? 'day.png':'night.png';
    Color bgcolor = data['isDaytime']? Colors.grey: Colors.indigo;
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async{
                     dynamic result = await Navigator.pushNamed(context, '/location');
                     setState((){
                       data = {
                         'time':result['time'],
                         'location':result['location'],
                         'flag':result['flag'],
                         'isDaytime': result['isDaytime']
                       };
                     });

                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],

                    ),
                    label: Text(
                      'Edit locaton',
                      style: TextStyle(
                      color: Colors.grey[300]
                    ),)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        letterSpacing: 2
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.white
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
