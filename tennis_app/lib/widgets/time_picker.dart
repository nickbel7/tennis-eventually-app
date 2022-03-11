import 'package:flutter/material.dart';
import 'buttons.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({Key? key}) : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late TimeOfDay time = const TimeOfDay(hour: 9, minute: 00);

  String getText() {
    if (time == null) {
      return 'Select Time';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  @override
  Widget build(BuildContext context) => DateInputWidget(
        title: 'Time',
        text: getText(),
        onClicked: () => pickTime(context),
      );

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time,
    );

    if (newTime == null) return;

    setState(() => time = newTime);
  }
}
