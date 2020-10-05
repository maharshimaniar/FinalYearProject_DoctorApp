import 'package:flutter/foundation.dart';

import 'patient.dart';

class Appointment {
  final String appointmentId;
  final Patient patient;
  final DateTime appointmentDateTime;
  final DateTime accessDateTime;

  Appointment(
      {@required this.appointmentId,
      @required this.appointmentDateTime,
      @required this.patient,
      @required this.accessDateTime});
}
