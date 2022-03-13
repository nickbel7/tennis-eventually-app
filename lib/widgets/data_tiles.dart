import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';

class BookingRow extends StatelessWidget {

  final String day;
  final String time;
  final String court;
  final Color bgColor;
  final Color fontColor;
  
  const BookingRow({
    Key? key,
    required this.day,
    required this.time,
    required this.court,
    required this.bgColor,
    required this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10,),
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              color: fontColor,
              fontSize: 14,
              fontFamily: "Nunito",
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            time,
            style: TextStyle(
              color: fontColor,
              fontSize: 14,
              fontFamily: "Nunito",
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            court,
            style: TextStyle(
              color: fontColor,
              fontSize: 14,
              fontFamily: "Nunito",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class CourtWidgetState extends StatelessWidget {
  final String text;
  final VoidCallback? onClicked;

  const CourtWidgetState({
    Key? key,
    required this.text,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          width: 118,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppTheme.colors.greenGoblin,
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
        ),
      ),
    );
  }
}

class HourSlotWidgetState extends StatelessWidget {
  final String text;

  const HourSlotWidgetState({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppTheme.colors.amazonGreen,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 111,
        vertical: 5,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.colors.sandStorm,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class CourtCardWidget extends StatefulWidget {
  const CourtCardWidget({Key? key}) : super(key: key);

  @override
  _CourtCardState createState() => _CourtCardState();
}

class _CourtCardState extends State<CourtCardWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 316,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selected = !selected;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppTheme.colors.amazonGreen),
              ),
              child: Text(
                '13:00-14:00',
                style: TextStyle(color: AppTheme.colors.sandStorm),
              ),
            ),
          ),
          Visibility(
            visible: selected,
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              width: 316,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppTheme.colors.sandStorm,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CourtWidgetState(
                    text: 'Court 1',
                  ),
                  CourtWidgetState(
                    text: 'Court 2',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
