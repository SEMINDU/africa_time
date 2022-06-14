import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  var location; // location name of the UI
  var time;  // the time in that location
  var flag; // flag of the location
  var url; //location url for api endpoint
  var isDaytime;// is it daytime or night time

 WorldTime(this.url,this.location,this.flag);


  Future<void> getTime () async{
    try{
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));


      Map data =  jsonDecode(response.body);

      //get properties from data

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDaytime = now.hour > 6 && now.hour< 19 ? true:false;
      time = DateFormat.jm().format(now);

    }
    catch (e){
      time = 'could not get time data';

    }


  }

}

