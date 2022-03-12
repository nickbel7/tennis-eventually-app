import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';

class CourtWidgetState extends StatelessWidget {
  final String text;
  final VoidCallback? onClicked;

  const CourtWidgetState({
    required this.text,
    this.onClicked,
  });

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
            )));
  }
}

class HourSlotWidgetState extends StatelessWidget {
  final String text;

  const HourSlotWidgetState({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xff226634),
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
              color: Color(0xffe4deb3),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 316,
          height: 36,
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
                  backgroundColor: MaterialStateProperty.all<Color>(
                      AppTheme.colors.amazonGreen)),
              child: Text('13:00-14:00',
                  style: TextStyle(color: AppTheme.colors.sandStorm))),
        ),
        Visibility(
          visible: selected,
          child: Container(
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
              )),
        ),
      ],
    );
  }
}
