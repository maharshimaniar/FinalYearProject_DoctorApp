import 'package:flutter/material.dart';

import '../Classes/patient.dart';

class PatientListTile extends StatelessWidget {
  final Patient patient;

  PatientListTile({@required this.patient});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        child: Icon(
          Icons.supervised_user_circle,
          size: 40,
        ),
      ),
      title: Text(
        patient.name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        patient.id,
        style: TextStyle(fontSize: 18),
      ),
      contentPadding: EdgeInsets.all(10),
      onTap: () {
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("${patient.name} pressed."),
          duration: Duration(seconds: 2),
        ));
      },
    );
  }
}
