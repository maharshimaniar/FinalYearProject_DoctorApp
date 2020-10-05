import 'package:flutter/material.dart';

class MedicineReminderListTile extends StatelessWidget {
  final String medicineName;
  final double quantity;
  final String unit;
  final String intake;
  final DateTime dateTime;

  MedicineReminderListTile(
      {@required this.dateTime,
      @required this.intake,
      @required this.medicineName,
      @required this.quantity,
      @required this.unit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        child:
            Text('${dateTime.hour.toString()}:${dateTime.minute.toString()}'),
      ),
      title: Text(medicineName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      subtitle: Text('$quantity $unit $intake'),
    );
  }
}
