import 'package:qrscan/qrscan.dart' as scanner;
import 'package:provider/provider.dart';
import '../Providers/patientProvider.dart';
import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../Screens/appDrawer.dart';

import './patientScreen.dart';
import './homeScreen.dart';
import './prescriptionScreen.dart';
import './reminderScreen.dart';

class BasePage extends StatefulWidget {
  static const routeName = '/homeScreen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<BasePage> {
  int _page = 0;
  final _pageOptions = [
    DoctorScreen(),
    ReminderScreen(),
    HomeScreen(),
    PrescriptionScreen(),
  ];
  final _pageTitle = [
    "Patients",
    "Appointments",
    "Home",
    "Prescriptions",
  ];
  String scanResult = '';
  Future<void> scanQRCode() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      scanResult = cameraScanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Theme.of(context).primaryColor, Colors.white]),
          ),
        ),
        title: Text(_pageTitle[_page]),
        actions: [
          FlatButton(
              onPressed: () async {
                await scanQRCode();
                bool result =
                    Provider.of<PatientProvider>(context, listen: false)
                        .adddPatientByQrScan(scanResult);
                if (result) {
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Patient added Successfully.'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('An Error Occured.'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              child: Container(width: 50,height: 50,child: Image.asset('assets/img/scan_qr.png')))
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Colors.black54,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.black,
        animationDuration: Duration(milliseconds: 300),
        items: <Widget>[
          Icon(Icons.contacts, color: Colors.white),
          Icon(Icons.alarm, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.description, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Center(
        child: _pageOptions[_page],
      ),
      drawer: AppDrawer(),
    );
  }
}
