import 'package:http/http.dart'; 
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

String location; //location name for the UI
String time; //time of the location
String flag; // flag the Country
String url; //url of the displayed location
bool isDayTime; // Day Time is True or False

WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/Asia/KolKata');
        Map data = jsonDecode(response.body);
        // print(data);
        // get properties from data
        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1,3);

        // Creating datetime Object
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        // Set the time property
        isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
        time = DateFormat.jm().format(now);

        
}
}

