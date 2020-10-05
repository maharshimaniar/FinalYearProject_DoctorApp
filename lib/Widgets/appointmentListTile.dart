import 'package:flutter/material.dart';

import '../Classes/patient.dart';

class AppointmentListTile extends StatelessWidget {
  final Patient patient;
  final DateTime appointmentDateTime;
  final String appointmentId;
  final DateTime accessTime;

  AppointmentListTile(
      {@required this.accessTime,
      @required this.patient,
      @required this.appointmentId,
      @required this.appointmentDateTime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        radius: 40,
        child: Text(
            '${appointmentDateTime.hour.toString()}:${appointmentDateTime.minute.toString()}'),
      ),
      title: Text(
        patient.name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(appointmentId),
    );
  }
}
