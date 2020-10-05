import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_point_tab_bar/pointTabBar.dart';

import '../Widgets/appointmentListTile.dart';

import '../Providers/appointmentProvider.dart';
import '../Classes/appointment.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    List<Appointment> _appointmentList =
        Provider.of<AppointmentProvider>(context).upcomingAppointments;

    return Scaffold(
      body: Container(
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.black,
                    indent: 30,
                    endIndent: 30,
                    thickness: 1 / 5,
                  );
                },
                itemCount: _appointmentList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Theme.of(context).primaryColor),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red[700],
                        size: 40,
                      ),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 4,
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) {
                      return showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('Delete Appointment'),
                          content: Text(
                            'Do you want to remove the Appointment?',
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            ),
                            FlatButton(
                              child: Text('Yes'),
                              onPressed: () {
                                Navigator.of(ctx).pop(true);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    onDismissed: (direction) {
                      setState(() {
                        Provider.of<AppointmentProvider>(context, listen: false)
                            .deleteAppointment(index);
                      });
                    },
                    child: AppointmentListTile(
                      appointmentDateTime:
                          _appointmentList[index].appointmentDateTime,
                      patient: _appointmentList[index].patient,
                      appointmentId: _appointmentList[index].appointmentId,
                      accessTime: _appointmentList[index].accessDateTime,
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
