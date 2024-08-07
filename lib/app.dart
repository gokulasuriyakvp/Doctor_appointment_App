
import 'package:doctor_appointment_application/views/appointment_screen.dart';
import 'package:doctor_appointment_application/views/dashboard.dart';
import 'package:doctor_appointment_application/views/doctor_list_screen.dart';
import 'package:doctor_appointment_application/views/profile_screen.dart';
import 'package:doctor_appointment_application/views/splash_screen.dart';
import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Appointment',
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          Dashboard(),
          DoctorListScreen(),
          AppointmentScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Doctor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_calendar),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        backgroundColor: Colors.white70,
        unselectedItemColor: Colors.blueGrey,
        unselectedLabelStyle: const TextStyle(color: Colors.blueGrey),
        onTap: _onItemTapped,
      ),
    );
  }
}