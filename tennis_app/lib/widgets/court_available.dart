import 'package:flutter/material.dart';

class CourtWidgetState extends StatelessWidget {
  final String text;

  const CourtWidgetState({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(200, 0, 200, 10),
        child: Container(
          width: 118,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff22aa67),
          ),
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff001112),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ));
  }
}
