import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';

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
