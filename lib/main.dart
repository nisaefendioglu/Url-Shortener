import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Shortener',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Shortly",
                  style: TextStyle(
                      fontSize: 40,
                      height: 3.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SvgPicture.asset(
                'assets/illustration.svg',
              ),
              Text(
                "Let's get started!",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text("Paste your first link into the field to shorten it",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
              TextField(
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Shorten a link here ...'
  ),),
              RaisedButton(
                onPressed: () {
                  print("RaisedButton Click");
                },
                color: Colors.blue,
                child: Text(
                  "SHORTEN IT!",
                  style: TextStyle(color: Colors.white , fontSize: 20,),
                ),
              )
            ],
          ),
        ));
  }
}
