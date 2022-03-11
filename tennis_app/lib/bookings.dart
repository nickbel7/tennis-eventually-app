import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';

class BookingsPage extends StatelessWidget {
  
  const BookingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25,),
      children: <Widget>[
        const SectionHeader(
          header: "Current"
        ),
        BookingRow(
          day: '23/01/2022',
          time: 'Mon. 18-19:00',
          court: 'Court 1',
          bgColor: AppTheme.colors.amazonGreen,
          fontColor: AppTheme.colors.sandStorm,
        ),
        const SectionHeader(
          header: "Previous"
        ),
        BookingRow(
          day: '23/01/2022',
          time: 'Mon. 18-19:00',
          court: 'Court 1',
          bgColor: AppTheme.colors.grassGreen,
          fontColor: AppTheme.colors.totallyBlack,
        ),
        BookingRow(
          day: '23/01/2022',
          time: 'Mon. 18-19:00',
          court: 'Court 1',
          bgColor: AppTheme.colors.grassGreen,
          fontColor: AppTheme.colors.totallyBlack,
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {

  final String header;

  const SectionHeader({
    Key? key,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            SizedBox(
                width: 319,
                height: 28,
                child: Text(
                    header,
                    style: TextStyle(
                        color: AppTheme.colors.totallyBlack,
                        fontSize: 20,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w700,
                    ),
                ),
            ),
            Container(
                width: 330,
                height: 1,
                color: AppTheme.colors.totallyBlack,
                margin: const EdgeInsets.only(bottom: 10.0),
            ),
        ],
    );
  }
}

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