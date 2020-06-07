import 'package:flutter/material.dart';
import 'GetLocation.dart';

void main() => runApp(CityApp());

class CityApp extends StatefulWidget {
  @override
  _CityAppState createState() => _CityAppState();
}

class _CityAppState extends State<CityApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: GetLocation.getMyLocation(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(snapshot.data.toString() , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 33.0,
                      color: Colors.blueAccent,
                    ),),
                  ],
                );
              }else if(snapshot.hasError){
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  void getCityName()async{
    GetLocation.getMyLocation();
  }
}

