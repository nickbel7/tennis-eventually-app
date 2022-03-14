import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';
// import 'package:tennis_app/widgets/buttons.dart';

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

class CourtWidgetState extends StatefulWidget {

  final String text;

  // FUNCTION CALLBACK
  // alternative : CallBackFunction (widget)
  // source : https://medium.com/@avnishnishad/flutter-working-with-callbacks-1d5e5f5d9c5a
  final Function(bool state)? notifyParent;  // state : 1(selected), 0(unselected)

  const CourtWidgetState({
    Key? key,
    required this.text,
    this.notifyParent,
  }) : super(key: key);

  @override
  State<CourtWidgetState> createState() => _CourtWidgetStateState();
}

class _CourtWidgetStateState extends State<CourtWidgetState> {

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
        widget.notifyParent!((selected ? true : false));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: (selected ? AppTheme.colors.greenGoblin : AppTheme.colors.grassGreen),
          ),
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.colors.totallyBlack,
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

// !! DEPRICATED
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

  final Function(bool state)? notifyParent;  // state : 1(selected), 0(unselected)

  const CourtCardWidget({
    Key? key,
    this.notifyParent,
  }) : super(key: key);

  @override
  _CourtCardState createState() => _CourtCardState();
}

class _CourtCardState extends State<CourtCardWidget> {
  
  bool selected = false;

  tappedCourt(selectedCourt) {
    print("success");
    print(selectedCourt);
    widget.notifyParent!((selectedCourt ? true : false));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Container(
              width: double.infinity,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppTheme.colors.amazonGreen,
              ),
              child: Text(
                '13:00-14:00',
                style: TextStyle(
                  color: AppTheme.colors.sandStorm,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Visibility(
            visible: selected,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8), 
                  bottomRight: Radius.circular(8)),
                color: AppTheme.colors.sandStorm,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CourtWidgetState(
                    text: 'Court 1',
                    notifyParent: tappedCourt,
                  ),
                  CourtWidgetState(
                    text: 'Court 2',
                    notifyParent: tappedCourt
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
