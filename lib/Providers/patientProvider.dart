import 'package:flutter/foundation.dart';
import 'dart:convert';

import '../Classes/patient.dart';

class PatientProvider with ChangeNotifier {
  List<Patient> _patientList = [
    Patient(
      id: '1',
      imageUrl: "https://picsum.photos/id/237/200/300",
      name: "Patient A",
      contactNumber: "9876543210",
    ),
    Patient(
      id: '2',
      imageUrl: "https://picsum.photos/id/237/200/300",
      name: "Patient B",
      contactNumber: "9876543210",
    ),
    Patient(
      id: '3',
      imageUrl: "https://picsum.photos/id/237/200/300",
      name: "Patient C",
      contactNumber: "9876543210",
    ),
    Patient(
      id: '4',
      imageUrl: "https://picsum.photos/id/237/200/300",
      name: "Patient D",
      contactNumber: "9876543210",
    ),
    Patient(
      id: '5',
      imageUrl: "https://picsum.photos/id/237/200/300",
      name: "Patient E",
      contactNumber: "9876543210",
    ),
  ];

  List<Patient> get doctorList {
    return [..._patientList];
  }

  void deletePatient(index) {
    _patientList.removeAt(index);
    notifyListeners();
  }

  bool adddPatientByQrScan(String scannedString) {
    try {
      var _scannedStringMap = json.decode(scannedString);
      if (_scannedStringMap['contactNumber'] != null &&
          _scannedStringMap['id'] != null &&
          _scannedStringMap['name'] != null &&
          _scannedStringMap['imageUrl'] != null) {
        _patientList.add(Patient(
          contactNumber: _scannedStringMap['contactNumber'],
          id: _scannedStringMap['id'],
          imageUrl: _scannedStringMap['imageUrl'],
          name: _scannedStringMap['name'],
        ));
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
