import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    // Background Image
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    // String flag = data['flag'];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 180.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                Text(data['time'], style: TextStyle(fontSize: 100.0,
                color: Colors.grey[600]),
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          data['location'],
                          style: TextStyle(fontSize: 60.0,
                          color: Colors.grey[600],)
                        ),
                        // CircleAvatar(child: Image.asset('assets/$flag'))
                      ]),
                ),
                    SizedBox(height: 95),
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDayTime':result['isDayTime']
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location,
                  size: 40.0,
                  color: Colors.blue),
                  label:
                      Text('Edit Location', style: TextStyle(fontSize: 40.0,
                      color: Colors.grey[600])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
