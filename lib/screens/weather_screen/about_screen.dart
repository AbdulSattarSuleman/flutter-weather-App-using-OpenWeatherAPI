import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.grey[700], size: 30),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Weatherify",
                    style: GoogleFonts.quicksand(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 22,
                    child: Image.asset('assets/images/appicon.png'),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                margin: EdgeInsets.only(
                  left: 3,
                  top: 5,
                ),
                decoration: BoxDecoration(),
                child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      "About",
                      style: GoogleFonts.quicksand(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700]),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "The purpose of building this App was only to learn how to work with APIs.",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                margin: EdgeInsets.only(left: 3, bottom: 5, top: 5),
                decoration: BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "Credits",
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700]),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "This project would not have been possible without the (Open Weather API) & some amazing people at (stackoverflow) whose answers helped me when I was stuck.",
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: Text(
                      "Get Connected",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              launch(
                                  'https://github.com/AbdulSattarSuleman/flutter-weather-App-using-OpenWeatherAPI');
                            },
                            icon: Icon(
                              FontAwesomeIcons.github,
                              color: Colors.grey[700],
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {
                              launch(
                                  "https://www.linkedin.com/in/abdulsattarsuleman/");
                            },
                            icon: Icon(
                              FontAwesomeIcons.linkedinIn,
                              color: Colors.grey[700],
                              size: 30,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: Text(
                    "2021 Jawan Pakistan Weather App. All Right Reserved.",
                    style: GoogleFonts.quicksand(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
