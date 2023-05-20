import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:intl/intl.dart';

import 'attendance.dart';

class AttendLoc extends StatefulWidget {
  const AttendLoc({Key? key}) : super(key: key);

  @override
  State<AttendLoc> createState() => _AttendLocState();
}

class _AttendLocState extends State<AttendLoc> {
  // TextEditingController dateController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    dateController.text = "";
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime()); //set the initial value of text field
    super.initState();
  }



   late String _timeString;

   late bool _serviceEnabled;
   late PermissionStatus _permissionGranted;

  late LocationData _userLocation;

  Future<void> _getUserLocation() async {
    Location location = Location();

    _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final locationData = await location.getLocation();
    setState(() {
      _userLocation = locationData;
    });

    // if (_userLocation != null) {
    //   print('Latitude: ${_userLocation?.latitude}');
    //   print('Longitude: ${_userLocation?.longitude}');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Mark With Location",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AttendanceMain()));
          },
        ),
        actions: [
          IconButton(icon: Image.asset("images/pro.png"),
            tooltip: 'View Profile',
            onPressed: (){},)
        ],
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(_timeString),

              TextField(


                controller: dateController, //editing controller of this TextField
                decoration: const InputDecoration(

                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                ),
                readOnly: true,  // when true user cannot edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );

                  if(pickedDate != null ){
                    print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                    print(formattedDate); //formatted date output using intl package =>  2022-07-04
                    //You can format date as per your need

                    setState(() {
                      dateController.text = formattedDate; //set foratted date to TextField value.
                    });
                  }else{
                    print("Date is not selected");
                  }
                },
              ),


              SizedBox(height: 25),


              ElevatedButton(
                onPressed: _getUserLocation,
                child: const Text('Check Location'),
              ),
              const SizedBox(height: 25),
              _userLocation != null
                  ? Wrap(
                children: [
                  Text('Your latitude: ${_userLocation?.latitude}'),
                  const SizedBox(width: 10),
                  Text('Your longitude: ${_userLocation?.longitude}'),
                ],
              )
                  : const Text(
                  'Please enable location service and grant permission'),

              SizedBox(height: 25),

          ElevatedButton(
            onPressed: (){
              print('Latitude: ${_userLocation?.latitude}');
              print('Longitude: ${_userLocation?.longitude}');
              print('Time:$_timeString');
              },
            child: const Text('Submit Attendance'),)


            ],
          ),
        ),
      ),
    );


  }
  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }
}


