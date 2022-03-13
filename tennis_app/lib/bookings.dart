import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';
import 'package:tennis_app/widgets/headers.dart';
import 'package:tennis_app/widgets/data_tiles.dart';

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