import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/screens/about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (_) => AboutScreen()));
              },
              icon: Icon(
                Icons.info_outline,
                color: Colors.grey[700],
              ))
        ],
      ),
      body: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  TextEditingController cityController = TextEditingController();
  var mainTemp;
  var city;
  // API Fetch Logic
  Future<void> getWeather() async {
    final String searchQuery = cityController.text;
    const String appId = "1137d4b46dee4d51f303660eca05a5f8";
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$searchQuery&appid=$appId&units=metric'));
    // var data = jsonDecode(response.body);
    var data = json.decode(response.body);
    if (response.statusCode == 404) {
      // cityNotFoundError(context);
    }
    if (searchQuery.isEmpty) {
      // blankFieldError(context);
    }
    setState(() {
      mainTemp = data['main']['temp'];
      city = data['name'];
    });
  }

  // Detect Network Error
  detectConnection(connection) async {
    connection = await (Connectivity().checkConnectivity());

    if (connection != ConnectivityResult.mobile &&
        connection != ConnectivityResult.wifi) {
      // noNetworkError(context);
    } else {
      getWeather();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "Weatherify",
              style: GoogleFonts.quicksand(
                  fontSize: 60,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700]),
            ),
          ),
          SizedBox(
            width: 330,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade700,
                      // color: Color(0xffcccccc),
                      blurRadius: 5.0,
                      spreadRadius: 1,
                    )
                  ]),
              width: 340,
              child: TextField(
                controller: cityController,
                onSubmitted: (callback) => {
                  detectConnection(context),
                },
                style: GoogleFonts.quicksand(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Colors.deepPurple,
                  labelText: 'Search for a city...',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: false,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: city == null
                  ? Text(
                      "Type & Hit enter...",
                      style: GoogleFonts.quicksand(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                    )
                  : Text(
                      'Weather in $city',
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                    )),
          Padding(
            padding: const EdgeInsets.only(
              top: 3,
              bottom: 10,
            ),
            child: mainTemp == null
                ? Text(
                    "And do you know you're cute? ",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  )
                : Text(
                    "$mainTemp" "°C",
                    style: GoogleFonts.quicksand(
                      fontSize: 33,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
          ),
          Flexible(
              child: Container(
            width: double.infinity,
            child: SvgPicture.asset('assets/images/weatherperson.svg'),
          ))
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}

cityNotFoundError(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 260,
            width: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "City Not Found!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/404-cat.svg',
                  height: 165,
                ),
                Text(
                  "Check the Spelling or try a different city.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),
                )
              ],
            ),
          ),
          actionsPadding: EdgeInsets.all(10),
          contentPadding: EdgeInsets.all(10),
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        );
      });
}
