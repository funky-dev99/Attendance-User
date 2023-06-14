

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'attend_location_out.dart';
import 'attendance.dart';

class AttendLoc extends StatefulWidget {
  const AttendLoc({Key? key}) : super(key: key);

  @override
  State<AttendLoc> createState() => _AttendLocState();
}

class _AttendLocState extends State<AttendLoc> {
  TextEditingController dateController = TextEditingController();
  late String _timeString;
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LocationData? _userLocation;

  @override
  void initState() {
    dateController.text = "";
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
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
  }

  Future<bool> markInAttendanceRecord(BuildContext context, var companyId,
      var companyName, var userId, var userName, var markIn, var lat,
      var long) async {
    var url = "http://api.talent.cbs.lk/createAttendanceRecord.php";
    var atUnicId = await getAttendanceUnicId();
    var data = {
      "unic_id": '$atUnicId',
      "company_id": '$companyId',
      "company_name": '$companyName',
      "user_id": '$userId',
      "user_name": '$userName',
      "mark_in": '$markIn',
      "mark_in_lat": '$lat',
      "mark_in_long": '$long',
      "mark_out": '0',
      "mark_out_lat": '',
      "mark_out_long": '',
      "delete_row": '0',
      "delete_by_id": '',
      "update_by_id": '',
    };

    http.Response res = await http.post(
      Uri.parse(url),
      body: data,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName("utf-8"),
    );
    print (res.statusCode.toString());

    if (res.statusCode.toString() == "200") {
      if (jsonDecode(res.body) == "Account already exists") {
        // Handle account already exists case
      } else if (jsonDecode(res.body) == "true") {
        await saveMarkInAttendance(
            '$atUnicId',
            '$companyId',
            '$companyName',
            '$userId',
            '$userName',
            '$markIn',
            '$lat',
            '$long');
        Navigator.of(context).pop(false);
        snackBar(context, "Done", Colors.green);
        return true;
      }
    } else {
      snackBar(context, "Error", Colors.redAccent);
      return false;
    }
    return true;
  }

  Future<int> getAttendanceUnicId() async {
    int timestamp = DateTime
        .now()
        .millisecondsSinceEpoch;
    int unicSupplierId = timestamp;
    return unicSupplierId;
  }

  Future<bool> saveMarkInAttendance(var unicId, var companyId, var companyName,
      var userId, var userName, var markIn, var markInLat,
      var markInLong) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('unic_id', '$unicId');
    prefs.setString('company_id', '$companyId');
    prefs.setString('company_name', '$companyName');
    prefs.setString('user_id', '$userId');
    prefs.setString('user_name', '$userName');
    prefs.setString('mark_in', '$markIn');
    prefs.setString('mark_in_lat', '$markInLat');
    prefs.setString('mark_in_long', '$markInLong');
    return true;
  }

  void snackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
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
              context,
              MaterialPageRoute(builder: (context) => AttendanceMain()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
              size: 30.0,
            ),
            color: Colors.black,
            tooltip: 'View Profile',
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_timeString),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Enter Date",
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  if (pickedDate != null) {
                    String formattedDate = DateFormat('yyyy-MM-dd').format(
                        pickedDate);
                    setState(() {
                      dateController.text = formattedDate;
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              SizedBox(height: 25),
              MaterialButton(
                onPressed: _getUserLocation,
                child: const Text(
                  'Get Your Location',
                  style: TextStyle(color: Colors.white),
                ),
                minWidth: 150.0,
                height: 50.0,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
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


              MaterialButton(
                onPressed: () async {
                  if (_userLocation != null) {
                    String unicId = await getAttendanceUnicId().toString();
                    String companyId = '1234'; // Replace with your companyId value
                    String companyName = 'Test'; // Replace with your companyName value
                    String userId = '12345'; // Replace with your userId value
                    String userName = 'test@gmail.com'; // Replace with your userName value
                    String markIn = _timeString;
                    String? markInLat = _userLocation?.latitude.toString();
                    String? markInLong = _userLocation?.longitude.toString();
                    print('Click');

                    bool success = await markInAttendanceRecord(
                      context,
                      companyId,
                      companyName,
                      userId,
                      userName,
                      markIn,
                      markInLat,
                      markInLong,
                    );

                    if (success) {
                      Navigator.of(context).pop(false);
                      snackBar(context, "Done", Colors.green);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => AttendLocOut()));

                    } else {
                      snackBar(context, "Error", Colors.redAccent);
                    }
                  } else {
                    snackBar(context,
                        "Please enable location service and grant permission",
                        Colors.redAccent);
                  }
                },
                child: const Text('Mark Your In'),
                minWidth: 150.0,
                height: 50.0,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
