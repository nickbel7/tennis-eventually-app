import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';
import 'package:tennis_app/widgets/buttons.dart';
import 'widgets/date_picker.dart';
import 'widgets/time_picker.dart';

class HomeOpponentPage extends StatelessWidget {
  const HomeOpponentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 350,
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Request Opponent',
                      style: TextStyle(
                        color: AppTheme.colors.totallyBlack,
                        fontSize: 20,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const DatePickerWidget(),
                const TimePickerWidget(),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SimpleButton(
                      bordercolor: AppTheme.colors.grassGreen,
                      fillcolor: AppTheme.colors.grassGreen,
                      textcolor: Colors.white,
                      text: 'Confirm',
                      width: 277,
                      height: 36),
                ),
              ],
            ))
      ],
    );
  }
}
