import 'package:flutter/material.dart';

Widget bookingsList = ListView(
  children: [
    _bookingRow('123', '456', '789'),
    Icon(
      Icons.camera,
      size: 50,
    ),
    Icon(
      Icons.chat,
      size: 50,
    ),
    Icon(
      Icons.linked_camera,
      size: 50,
    ),
  ],
);

Row _bookingRow(String day, String time, String court) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(day),
      Text(time),
      Text(court),
    ],
  );
}