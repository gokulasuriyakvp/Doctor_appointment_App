import 'dart:async';
import 'package:flutter/material.dart';
import 'sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
    Image.asset(
    "assets/images/background_image.jpeg",
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    ), Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
      body:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              radius: 150, // Adjust the radius as needed
              backgroundImage: AssetImage('assets/images/splash_screen_image.jpg'),
            ),
            SizedBox(height: 10), // Add some spacing between the image and the text
            Text(
              'Book Appointment',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            SizedBox(height: 10), // Add some spacing between the image and the text
            Text(
              'Book Doctors AppointMent For The Patients',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(child: Text('Get  Started',style:  TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // button's shape
          ),
          minimumSize: Size(250, 60),
        ),
        onPressed: () {},
      ),
          ],
        ),
      ),
    ),
    ],
    );
  }
}
