import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'URL Shortener',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool visibilityTag = false;
  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "tag") {
        visibilityTag = visibility;
      }
    });
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  String shortUrl = "";
  String value = "";
  String buttonText = "COPY!";
  bool isChanged = true;
  bool showCopyButton = false;
  TextEditingController urlcontroller = TextEditingController();
  getData() async {
    var url = 'https://api.shrtco.de/v2/shorten?url=${urlcontroller.text}';
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    if (result['ok']) {
      setState(() {
        shortUrl = result['result']['short_link'];
      });
    } else {
      print(response);
    }
  }

  copy(String url) {
    FlutterClipboardManager.copyToClipBoard(url).then((value) {});
  }

  buildRow(String data, bool original) {
    return SingleChildScrollView(
      child: original
          ? Container(
              alignment: Alignment.center,
              child: Text(
                data,
              ))
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  data,
                ),
                ElevatedButton(
                  child: Text(buttonText),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: Size(300, 40),
                  ),
                  onPressed: () {
                    copy(shortUrl);
                    setState(() {
                      if (isChanged == true) {
                        buttonText = "COPIED!";
                      }
                    });
                  },
                ),
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          SvgPicture.asset(
            'assets/logo.svg',
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
          SizedBox(
            height: 130,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  color: Color.fromRGBO(59, 48, 84, 1),
                  child: SvgPicture.asset(
                    'assets/shape.svg',
                    color: Color.fromRGBO(75, 63, 107, 1),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 40,
                      child: TextField(
                        onChanged: (text) {
                          value = "URL : " + text;
                        },
                        controller: urlcontroller,
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
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () async {
                          await getData();
                          setState(() {
                            showCopyButton = true;
                          });
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
                  ],
                ),
              ],
            ),
          ),
          if (showCopyButton)
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "Your URL Link",
                      style: TextStyle(
                        color: Color.fromRGBO(59, 48, 84, 1),
                      ),
                    ),
                    buildRow(value, true),
                    buildRow(shortUrl, false),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
