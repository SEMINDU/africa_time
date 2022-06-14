import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';



class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void updateTime(index)async{
    WorldTime instance = location[index];
    await instance.getTime();
    //navigate to homescreen  with the data
    Navigator.pop(context,{
      'time':instance.time,
      'location':instance.location,
      'flag':instance.flag,
      'isDaytime': instance.isDaytime
    }

    );

  }
  List<WorldTime> location = [

    // Africa times
    WorldTime('Africa/Abidjan','Abidjan','Côte D\'ivoire'),
    WorldTime('Africa/Accra','Accra','Ghana'),
    WorldTime('Africa/Algiers','Algiers','Algeria'),
    WorldTime('Africa/Bissau','Bissau','Guinea-bissau'),
    WorldTime('Africa/Cairo','Cairo','Egypt'),
    WorldTime('Africa/Casablanca','Casablanca','morocco'),
    WorldTime('Africa/Ceuta','Ceuta','Spain'),
    WorldTime('Africa/El_Aaiun','El_Aaiun','western sahara'),
    WorldTime('Africa/Johannesburg','Johannesburg','south africa'),
    WorldTime('Africa/Juba','Juba','south sudan'),
    WorldTime('Africa/Khartoum','Khartoum','sudan'),
    WorldTime('Africa/Lagos','Lagos','nigeria'),
    WorldTime('Africa/Maputo','Maputo','mozambique'),
    WorldTime('Africa/Monrovia','Monrovia','liberia'),
    WorldTime('Africa/Nairobi','Nairobi','kenya'),
    WorldTime('Africa/Ndjamena','Ndjamena','chad'),
    WorldTime('Africa/Sao_Tome','Sao_Tome','sao tome and principe'),
    WorldTime('Africa/Tripoli','Tripoli','libya'),
    WorldTime('Africa/Tunis','Tunis','tunisia'),
    WorldTime('Africa/Windhoek','Windhoek','namibia'),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,

      ),
      body:ListView.builder(
          itemCount: location.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
                child: Card(
                  child:ListTile(
                    onTap: (){
                      updateTime(index);
                    },
                    title: Text(location[index].location),
                    leading: CircleAvatar(
                      backgroundImage:NetworkImage('https://countryflagsapi.com/png/${location[index].flag}'),
                    ),
                  ) ,
                ),
              ),
            );
          }
          ),


    );
  }
}
