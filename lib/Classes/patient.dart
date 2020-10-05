import 'package:flutter/foundation.dart';

class Patient {
  final String name;
  final String id;
  final String contactNumber;
  final String imageUrl;

  Patient(
      {@required this.id,
      @required this.imageUrl,
      @required this.name,
      @required this.contactNumber,
  });
}
