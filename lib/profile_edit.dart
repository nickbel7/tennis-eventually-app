import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';
import 'package:tennis_app/widgets/buttons.dart';
import 'package:tennis_app/widgets/inputs.dart';
import 'package:tennis_app/widgets/headers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tennis_app/models/user.dart';

class ProfileEditPage extends StatefulWidget {
  final User user;

  const ProfileEditPage({
    required this.user,
  });

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  double _ratingValue = 0;

  void _pushProfile() {
    User user2 = User(
      firstName: widget.user.firstName,
      lastName: widget.user.lastName,
      phone: widget.user.phone,
      email: widget.user.email,
      ratingvalue: _ratingValue,
    );

    Navigator.pop(context, user2);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Nice! Your profile changed'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      children: [
        const SizedBox(
          height: 25,
        ),
        InputField(
          user: widget.user,
          labeltext: 'Name',
          hinttext: widget.user.firstName,
        ),
        SurnameInputField(
          user: widget.user,
          labeltext: 'Lastname',
          hinttext: widget.user.lastName,
        ),
        PhoneInputField(
          user: widget.user,
          labeltext: 'Phone',
          hinttext: widget.user.phone,
        ),
        EmailInputField(
          user: widget.user,
          labeltext: 'Εmail',
          hinttext: widget.user.email,
        ),
        const SectionHeader(header: 'Level'),
        RatingBar(
            initialRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 6,
            ratingWidget: RatingWidget(
                full: Icon(
                  Icons.star,
                  color: AppTheme.colors.totallyBlack,
                ),
                half: Icon(
                  Icons.star_half,
                  color: AppTheme.colors.totallyBlack,
                ),
                empty: Icon(
                  Icons.star_outline,
                  color: AppTheme.colors.totallyBlack,
                )),
            onRatingUpdate: (value) {
              setState(() {
                _ratingValue = value;
              });
            }),
        SizedBox(
          height: 150,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            child: Image.asset(
              "assets/avatar.png",
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: SimpleButton(
              fillcolor: AppTheme.colors.grassGreen,
              textcolor: AppTheme.colors.totallyBlack,
              text: 'SAVE',
              width: 204,
              height: 36,
              onClick: _pushProfile,
            ))
      ],
    );
  }
}
