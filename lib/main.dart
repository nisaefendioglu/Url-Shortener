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
                      color: Color.fromRGBO(53, 50, 62, 10),
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
                      color: Color.fromRGBO(53, 50, 62, 10),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Paste your first link into the field to shorten it",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(76, 74, 85, 10),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Shorten a link here ...'),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Button Click");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minimumSize: Size(60, 40),
                    ),
                    child: Text('SHORTEN IT!'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
