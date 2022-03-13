import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayerCard extends StatelessWidget {
  final String firstName;
  final String lastName;

  const PlayerCard({
    Key? key,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppTheme.colors.grassGreen,
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                // width: 73,
                // height: 73,
                flex: 2,
                child: SizedBox(
                  height: 75,
                  width: 75,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: Image.asset(
                      "assets/avatar.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 5),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 70,
                        height: 50,
                        child: Text(
                          firstName + '\n' + lastName,
                          style: const TextStyle(
                            color: Color(0xffe4deb3),
                            fontSize: 13,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      // const SizedBox(height: 19),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: AppTheme.colors.tennisBall,
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: AppTheme.colors.tennisBall,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_half,
                            color: AppTheme.colors.tennisBall,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 5),
              Icon(FontAwesomeIcons.whatsapp,
                  color: AppTheme.colors.sandStorm, size: 22.0),
              const SizedBox(width: 15),
              Icon(FontAwesomeIcons.instagram,
                  color: AppTheme.colors.sandStorm, size: 22.0),
              const SizedBox(width: 15),
              Icon(FontAwesomeIcons.facebookF,
                  color: AppTheme.colors.sandStorm, size: 20.0),
            ],
          ),
          // const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppTheme.colors.tennisBall,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.only(
              left: 3,
              right: 5,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.watch_later,
                  color: AppTheme.colors.sandStorm,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mon.",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppTheme.colors.sandStorm,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "13-14:00",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppTheme.colors.sandStorm,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerTile extends StatelessWidget {
  final String fisrtName;
  final String lastName;

  const PlayerTile({
    Key? key,
    required this.fisrtName,
    required this.lastName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      // width: 328,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppTheme.colors.grassGreen,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5, ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: AppTheme.colors.tennisBall, width: 1, ),
            ),
            child: Image.asset('assets/avatar.png'),
          ),
          const SizedBox(width: 10),
          Text(
            fisrtName + ' ' + lastName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.colors.totallyBlack,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}