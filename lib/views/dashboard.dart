import 'package:flutter/material.dart';
import 'dart:convert'; // Import for jsonDecode
import 'package:flutter/services.dart'; // Import for rootBundle

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<dynamic> jsonData = [];

  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('asset/Sample_json.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;
    });
    print(jsonData);
  }

  @override
  void initState() {
    super.initState();
    loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.subject,
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Handle tap
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20, // Adjust the radius as needed
                backgroundImage: AssetImage(
                    'assets/images/doctor logo image.jpg'), // Replace with your image asset
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(200.0),
          child: Container(
            padding: const EdgeInsets.only(left: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.deepOrange,
                  ),
                ),
                const Text(
                  'Lets Book The Appointment',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 11, horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      hintText: 'Search Categories',
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft, // Aligns the text to the left
              padding: const EdgeInsets.only(left: 16.0, top: 16.0), // Add left margin
              child: Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 25,
                ),
              ),
            ),
            // Row with ElevatedButtons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(6, (index) => Padding(
                  padding: const EdgeInsets.all(4.0), // Add spacing between buttons
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle button press
                      print('Button Pressed $index!');
                    },
                    style: ElevatedButton.styleFrom(
                     // primary: Colors.pinkAccent, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ).copyWith(
                      minimumSize: MaterialStateProperty.all(Size(80, 60)), // Adjust size if needed
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/image1.jpg', width: 30, height: 30), // Replace with your image
                        SizedBox(width: 8), // Add space between the image and text
                        Text('Button $index'),
                      ],
                    ),
                  ),

                )),
              ),
            ),
            SizedBox(
              height: 20, // Adjust the height if needed
            ),
            Container(
              alignment: Alignment.centerLeft, // Aligns the text to the left
              padding: EdgeInsets.only(left: 16.0, top: 16.0), // Add left margin
              child: Row(
                children: [
                  Text(
                    'Top Doctors',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(width: 80), // Space between text elements
                  Text(
                    'Available',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(width: 16), // Space between text and icon
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                ],
              ),
            ),
            // ListView.builder wrapped in an Expanded widget
            SizedBox(
              height: 300, // Adjust the height as needed
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: jsonData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              jsonData[index]["name"].toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              jsonData[index]["hobby"].toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Your onPressed logic here
                                  print("Button 1 pressed");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red, // Set your desired background color here
                                ),
                                child: Text('Book Appointment',style: TextStyle(color: Colors.white),),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Your onPressed logic here
                                  print("Button 2 pressed");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple, // Set your desired background color here
                                ),
                                child: Text('7AM-10AM',style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
                        ],
    ),
      ),
    );
  }
}
