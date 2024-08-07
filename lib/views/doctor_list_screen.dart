import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({super.key});

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  List<dynamic> jsonData = [];

  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.rootBundle.loadString('asset/Sample_json.json');
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
        title: const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Doctor List',
            style: TextStyle(fontSize: 20.0),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/doctor logo image.jpg',
              ), // replace with your image URL
            ),
          ),
        ],
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 11, horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    hintText: 'Search Categories',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              ListView.builder(
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
            ],
          ),
        ),
      ),
    );
  }
}
