import 'package:doctor_appointment_application/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int _activeButtonIndex = 0;
  TextEditingController datePickerController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );
    if (pickedDate != null) {
      datePickerController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Appointment',
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
                  'assets/images/doctor logo image.jpg'), // Corrected file name
            ),
          ),
        ],
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20), // Add space between AppBar and Card
              Card(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 30),
                  child: Column(
                    children: [
                      Text(
                        'Dr. John', // Replace with your dynamic data
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20), // Space between texts
                      Text(
                        'Heart Specialist', // Replace with your dynamic data
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft, // Aligns the text to the left
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0), // Add left margin
                  child: Text(
                    'Schedules',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      TextFormField(
                        controller: datePickerController,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "Click here to select date",
                          border: OutlineInputBorder(), // Add a border
                          enabledBorder: OutlineInputBorder( // Border when the field is enabled
                            borderSide: BorderSide(color: Colors.grey), // Change color if needed
                          ),
                          focusedBorder: OutlineInputBorder( // Border when the field is focused
                            borderSide: BorderSide(color: Colors.black), // Change color if needed
                          ),
                          prefixIcon: Icon(Icons.calendar_today), // Add an icon
                        ),
                        onTap: () => onTapFunction(context: context),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft, // Aligns the text to the left
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0), // Add left margin
                  child: Text(
                    'Visit Hours',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _activeButtonIndex = 0; // Set index for the first button
                          });
                          print("Button 1 pressed");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _activeButtonIndex == 0
                              ? Colors.deepPurpleAccent
                              : Colors.white,
                          foregroundColor: _activeButtonIndex == 0
                              ? Colors.white
                              : Colors.black,
                          minimumSize: Size(120, 50),
                        ),
                        child: Text('7AM'),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _activeButtonIndex = 1; // Set index for the second button
                          });
                          print("Button 2 pressed");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _activeButtonIndex == 1
                              ? Colors.deepPurpleAccent
                              : Colors.white,
                          foregroundColor: _activeButtonIndex == 1
                              ? Colors.white
                              : Colors.black,
                          minimumSize: Size(120, 50),
                        ),
                        child: Text('8AM'),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _activeButtonIndex = 2; // Set index for the third button
                          });
                          print("Button 3 pressed");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _activeButtonIndex == 2
                              ? Colors.deepPurpleAccent
                              : Colors.white,
                          foregroundColor: _activeButtonIndex == 2
                              ? Colors.white
                              : Colors.black,
                          minimumSize: Size(120, 50),
                        ),
                        child: Text('9AM'),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _activeButtonIndex = 3; // Set index for the fourth button
                          });
                          print("Button 4 pressed");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _activeButtonIndex == 3
                              ? Colors.deepPurpleAccent
                              : Colors.white,
                          foregroundColor: _activeButtonIndex == 3
                              ? Colors.white
                              : Colors.black,
                          minimumSize: Size(120, 50),
                        ),
                        child: Text('10AM'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft, // Aligns the text to the left
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0), // Add left margin
                  child: Text(
                    'Patient',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter the Mobile Number',
                    hintText: 'Enter the Mobile Number',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: false, // Changed to false for mobile number
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: {
                    0: FixedColumnWidth(150), // Fixed width for the first column
                    1: FixedColumnWidth(200), // Fixed width for the second column
                  },
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'MrD23',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'John Smith',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 8), // Space between text and button
                                ElevatedButton(
                                  onPressed: () {
                                    print('Button Pressed');
                                  },
                                  child: Text('Select',
                                  style: TextStyle(color: Colors.white),),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'MrD25',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'john',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 8), // Space between text and button
                                ElevatedButton(
                                  onPressed: () {
                                    print('Button Pressed');
                                  },
                                  child: Text('Select',
                                    style: TextStyle(color: Colors.white),),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'MrD26',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Smith',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 8), // Space between text and button
                                ElevatedButton(
                                  onPressed: () {
                                    print('Button Pressed');
                                  },
                                  child: Text('Select',
                                    style: TextStyle(color: Colors.white),),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text(
                  'Book Appointment',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // button's shape
                  ),
                  minimumSize: Size(380, 60),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Dashboard()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
