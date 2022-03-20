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

class CourtWidgetState extends StatefulWidget {

  // FUNCTION CALLBACK
  // alternative : CallBackFunction (widget)
  // source : https://medium.com/@avnishnishad/flutter-working-with-callbacks-1d5e5f5d9c5a
  final Function(Court courtState)? notifyParent;  // state : 1(selected), 0(unselected)
  final Court court;

  const CourtWidgetState({
    Key? key,
    this.notifyParent,
    required this.court,
  }) : super(key: key);

  @override
  State<CourtWidgetState> createState() => _CourtWidgetStateState();
}

class _CourtWidgetStateState extends State<CourtWidgetState> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.court.selected = !widget.court.selected;
        });
        widget.notifyParent!(widget.court);
      },
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: (widget.court.selected ? AppTheme.colors.greenGoblin : AppTheme.colors.grassGreen),
        ),
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.court.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.colors.totallyBlack,
                fontSize: 12,
              ),
            ),
          ],
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

  final Function(CourtSlot courtSlotState, int idx)? notifyParent;  // state : 1(selected), 0(unselected)
  final CourtSlot currentSlot;
  final int slotIndex;

  const CourtCardWidget({
    Key? key,
    this.notifyParent,
    required this.currentSlot,
    required this.slotIndex,
  }) : super(key: key);

  @override
  _CourtCardState createState() => _CourtCardState();
}

class _CourtCardState extends State<CourtCardWidget> {
  
  bool _selected = false;

  void _tappedCourt(selectedCourt) {
    // widget.notifyParent!((selectedCourt ? true : false));
    

    if (selectedCourt.title == 'Court 1') {
      widget.currentSlot.court2.selected = false;
      widget.currentSlot.court1 = selectedCourt;
    }
    else {
      widget.currentSlot.court1.selected = false;
      widget.currentSlot.court2 = selectedCourt;
    }

    // (widget.currentSlot.court1.selected ? print('court 1 check') : null);
    // (widget.currentSlot.court2.selected ? print('court 2 check') : null);
    widget.notifyParent!(widget.currentSlot, widget.slotIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Stack(
        children: [
          Visibility(
            visible: _selected,
            child: Container(
              height: 70,
              padding: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8), 
                  bottomRight: Radius.circular(8)),
                color: AppTheme.colors.sandStorm,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: widget.currentSlot.court1.available,
                    child: CourtWidgetState(
                      notifyParent: _tappedCourt,
                      court: widget.currentSlot.court1,
                    ),
                  ),
                  Visibility(
                    visible: widget.currentSlot.court2.available,
                    child: CourtWidgetState(
                      notifyParent: _tappedCourt,
                      court: widget.currentSlot.court2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selected = !_selected;
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
                widget.currentSlot.timeSlot,
                style: TextStyle(
                  color: AppTheme.colors.sandStorm,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}

// CLASSES
class Court{
  String title;
  bool available;
  bool selected;

  Court({
    required this.title,
    required this.available,
    required this.selected,
  });
}

class CourtSlot{
  String timeSlot;
  Court court1;
  Court court2;
  int? selectedCourt;

  CourtSlot({
    required this.timeSlot,
    required this.court1,
    required this.court2,
    this.selectedCourt,
  });
}

class Booking{
  final DateTime? dateTime;
  final String day;
  final String hour;
  final String court;

  const Booking({
    this.dateTime,
    required this.day,
    required this.hour,
    required this.court,
  });
}