import 'package:FinalProject/Classes/appointment.dart';
import 'package:FinalProject/Widgets/appointmentListTile.dart';
import '../Providers/appointmentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  static const routeName = '/history';

  @override
  Widget build(BuildContext context) {
    final List<Appointment> _appointmentList =
        Provider.of<AppointmentProvider>(context, listen: false)
            .appointmentList;
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black54,
              endIndent: 10,
              indent: 10,
            ),
            itemCount: _appointmentList.length,
            itemBuilder: (context, index) {
              return AppointmentListTile(
                  accessTime: _appointmentList[index].accessDateTime,
                  patient: _appointmentList[index].patient,
                  appointmentId: _appointmentList[index].appointmentId,
                  appointmentDateTime:
                      _appointmentList[index].appointmentDateTime);
            },
          ),
        ),
      ),
    );
  }
}
