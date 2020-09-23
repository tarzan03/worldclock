import 'package:flutter/material.dart';
import 'package:worldclock/services/World_Time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

 List<WorldTime> locations = [
                       WorldTime(location:'Berlin',flag: 'Flag_of_Germany.png', url: 'Europe/Berlin'),
                       WorldTime(location:'New York',flag: 'Flag_of_the_United_States.png', url: 'America/New_York'),
                       WorldTime(location:'London',flag: 'Flag_of_the_United_Kingdom.png', url: 'Europe/London'),
                       WorldTime(location:'Dubai',flag: 'Flag_of_the_United_Arab_Emirates.png', url: 'Asia/Dubai'),
                       WorldTime(location:'Jakarta',flag: 'Flag_of_Indonesia.png', url: 'Asia/Jakarta'),
                       WorldTime(location:'Karachi',flag: 'Flag_of_Pakistan.png', url: 'Asia/Karachi'),
                       WorldTime(location:'Kabul',flag: 'Flag_of_Afghanistan.png', url: 'Asia/Kabul'),
                       WorldTime(location:'Kathmandu',flag: 'Flag_of_Nepal.png', url: 'Asia/Kathmandu'),
                       WorldTime(location:'Kolkata',flag: 'Flag_of_India.png', url: 'Asia/Kolkata'),
                       WorldTime(location:'Qatar',flag: 'Flag_of_Qatar.png', url: 'Asia/Qatar'),
                       WorldTime(location:'Tashkent',flag: 'Flag_of_Uzbekistan.png', url: 'Asia/Tashkent'),
                       WorldTime(location:'Adelaide',flag: 'Flag_of_Australia.png', url: 'Australia/Adelaide'),
                       WorldTime(location:'Brisbane',flag: 'Flag_of_Australia.png', url: 'Australia/Brisbane'),
                       WorldTime(location:'Currie',flag: 'Flag_of_Australia.png', url: 'Australia/Currie'),
                       WorldTime(location:'Lord_Howe',flag: 'Flag_of_Australia.png', url: 'Australia/Lord_Howe'),
                       WorldTime(location:'Melbourne',flag: 'Flag_of_Australia.png', url: 'Australia/Melbourne'),
                       WorldTime(location:'Perth',flag: 'Flag_of_Australia.png', url: 'Australia/Perth'),
                       WorldTime(location:'Sydney',flag: 'Flag_of_Australia.png', url: 'Australia/Sydney'),
                       WorldTime(location:'Bucharest',flag: 'Flag_of_Romania.png', url: 'Europe/Bucharest'),
                       WorldTime(location:'Dublin',flag: 'Flag_of_Ireland.png', url: 'Europe/Dublin'),
                       WorldTime(location:'Helsinki',flag: 'Flag_of_Finland.png', url: 'Europe/Helsinki'),
                       WorldTime(location:'Istanbul',flag: 'Flag_of_Turkey.png', url: 'Europe/Istanbul'),
                       WorldTime(location:'Madrid',flag: 'Flag_of_Spain.png', url: 'Europe/Madrid'),
                       WorldTime(location:'Moscow',flag: 'Flag_of_Russia.png', url: 'Europe/Moscow'),
                       WorldTime(location:'Paris',flag: 'Flag_of_France.png', url: 'Europe/Paris'),
                       WorldTime(location:'Stockholm',flag: 'Flag_of_Sweden.png', url: 'Europe/Stockholm'),
                       WorldTime(location:'Vienna',flag: 'Flag_of_Austria.png', url: 'Europe/Vienna'),
                       WorldTime(location:'Detroit',flag: 'Flag_of_the_United_States.png', url: 'America/Detroit'),                   
];

void updateTime(index) async {
  WorldTime instance = locations[index];
  await instance.getTime();
  //Navigate to the homepage with the updated time and location.
  Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
  });
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a location'),
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location,
              style: TextStyle(fontSize: 15),),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}')
              ),
            )
          );
        }),
    );
  }
}
