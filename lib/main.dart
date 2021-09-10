import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
        )),
  );
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
        backgroundColor: Colors.grey[300],
        body: Center(
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Shortly",
                  style: TextStyle(
                      fontSize: 40,
                      height: 2.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SvgPicture.asset(
                'assets/illustration.svg',
              ),
              Center(
                child: Text(
                  "Let's get started!",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Center(
                  child:
                      Text("Paste your first link into the field to shorten it",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          )),
                ),
              ),
              SizedBox(
                height: 80,
                width: 80,
                child: TextField(
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      border: OutlineInputBorder(),
                      hintText: 'Shorten a link here ...'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print("Button Click");
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  minimumSize: Size(50, 40),
                ),
                child: Text('SHORTEN IT!'),
              )
            ],
          ),
        ));
  }
}
