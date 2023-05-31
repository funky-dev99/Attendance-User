import 'dart:async';

import 'package:attend_user/methods/methods.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

import 'attendance.dart';

class AttendLoc extends StatefulWidget {
  const AttendLoc({Key? key}) : super(key: key);

  @override
  State<AttendLoc> createState() => _AttendLocState();
}

class _AttendLocState extends State<AttendLoc> {
  // TextEditingController dateController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  Timer? _resetTimer;
  GlobalKey<SlideActionState> slideActionKey = GlobalKey();


  @override

  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  void initState() {
    dateController.text = "";
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime()); //set the initial value of text field
    super.initState();
  }



  late String _timeString;

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  LocationData? _userLocation;

  void _startResetTimer() {
    _resetTimer?.cancel();
    _resetTimer = Timer(Duration(seconds: 1), () {
      slideActionKey.currentState?.reset();
    });
  }

  Future<void> _getUserLocation() async {
    Location location = Location();
    print('Getting user location...');
    _startResetTimer();

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
          "Location",
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
          IconButton(icon: Icon(Icons.person, size: 30.0,),
      color: Colors.black,
            tooltip: 'View Profile',
            onPressed: (){},)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: getSizeBoxHeightL(context)),

            Image.asset(
              "images/location.gif",
              height: 160.0,
              width: 160.0,
            ),

            SizedBox(height: getSizeBoxHeight(context)),


            Text(_timeString,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

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
                    dateController.text = formattedDate; //set formatted date to TextField value.
                  });
                }else{
                  print("Date is not selected");
                }
              },
            ),


            SizedBox(height: getSizeBoxHeight(context)),

            SlideAction(
              onSubmit: _getUserLocation,
              text: 'Get Your Location',
              textStyle: TextStyle(color: Colors.white, fontSize: 22),
              borderRadius: 12,
              innerColor: Colors.black,
              outerColor: Colors.grey,
              sliderButtonIcon: Icon(Icons.location_on,color: Colors.white,),

            ),


            // ElevatedButton(
            //   onPressed: _getUserLocation,
            //   child: const Text('Check Location'),
            // ),
            const SizedBox(height: 25),
            _userLocation != null
                ? Wrap(
              children: [
                Text('Your latitude: ${_userLocation?.latitude}',style: TextStyle(fontSize: 15,color: Colors.blue),),
                const SizedBox(width: 10),
                Text('Your longitude: ${_userLocation?.longitude}',style: TextStyle(fontSize: 15,color: Colors.blue),),
              ],
            )
                : const Text(
                'Please enable location service and grant permission',style: TextStyle(fontSize: 15,color: Colors.red),),

            SizedBox(height: 25),

            MaterialButton(
              onPressed: (){
                print('Latitude: ${_userLocation?.latitude}');
                print('Longitude: ${_userLocation?.longitude}');
                print('Time:$_timeString');
              },
              child: const Text('Submit Attendance',style: TextStyle(color: Colors.white),),
              minWidth: 150.0,
              height: 50.0,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
            ),
            ),


          ],
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