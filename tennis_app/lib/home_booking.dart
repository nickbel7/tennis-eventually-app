import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tennis_app/theme/app_theme.dart';
import 'package:tennis_app/widgets/buttons.dart';
import 'widgets/date_picker.dart';
import 'widgets/court_slot.dart';

class HomeBookingPage extends StatefulWidget {
  const HomeBookingPage({Key? key}) : super(key: key);

  @override
  State<HomeBookingPage> createState() => _HomeBookingPageState();
}

class _HomeBookingPageState extends State<HomeBookingPage> {
  void _popBooking() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DatePickerWidget(),
            const SizedBox(height: 10),
            Text('Request Component',
                style: TextStyle(
                  color: AppTheme.colors.totallyBlack,
                  fontSize: 20,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(height: 5),
            Expanded(
              child: ListView(
                children: const <Widget>[
                  CourtCardWidget(),
                  CourtCardWidget(),
                  CourtCardWidget(),
                  CourtCardWidget(),
                  CourtCardWidget(),
                  CourtCardWidget(),
                ],
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SimpleButton(
                      fillcolor: AppTheme.colors.grassGreen,
                      bordercolor: AppTheme.colors.grassGreen,
                      textcolor: AppTheme.colors.sandStorm,
                      text: 'BOOK COURT',
                      width: 204,
                      height: 36,
                      onClick: _popBooking,
                    )))
          ],
        ));
  }
}
