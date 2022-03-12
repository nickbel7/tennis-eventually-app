import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faker/faker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _pushBooking() {

  }

  void _pushOpponent() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              IconButton(
                text: "BOOK COURT", 
                width: 340, 
                height: 60,
                onClick: _pushBooking,
              ),
              ButtonOutlined(
                text: "REQUEST OPPONENT", 
                width: 340, 
                height: 40,
                onClick: _pushOpponent,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(9, 10, 9, 7),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Available Players',
              style: TextStyle(
                color: AppTheme.colors.totallyBlack,
                fontSize: 20,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.colors.amazonGreen,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
            // height: 400,
            child: GridView.builder(
              // crossAxisCount: 2,
              // crossAxisSpacing: 14.0,
              // mainAxisSpacing: 0,
              // childAspectRatio: 1,
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              // IMPLEMENTATION WITH GENERATOR
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14.0,
                mainAxisSpacing: 0,
                childAspectRatio: 1,
              ),
              itemCount: 50,
              itemBuilder: (context, index) {
                return PlayerCard(
                  firstName: faker.person.firstName(),
                  lastName: faker.person.lastName(),
                );
              },
              // children: const [
              //   PlayerCard(),
              //   PlayerCard(),
              //   PlayerCard(),
              //   PlayerCard(),
              //   PlayerCard(),
              //   PlayerCard(),
              //   PlayerCard(),
              //   PlayerCard(),
              //   PlayerCard(),
              // ],
            )
          )
        ),
      ],
    );
  }
}

class IconButton extends StatelessWidget {

  // final Color bordercolor_i;
  // final Color fillcolor_i;
  // final Color textcolor_i;
  final String text;
  final double height;
  final double width;
  // final Icon icon_type;

  final VoidCallback? onClick;

  const IconButton({
    Key? key,
    // required this.bordercolor_i,
    // required this.fillcolor_i,
    // required this.textcolor_i,
    required this.text,
    required this.width,
    required this.height,
    this.onClick,
    // required this.icon_type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: AppTheme.colors.amazonGreen,
          borderRadius: BorderRadius.circular(4),
          // border: Border.all(color: bordercolor_i),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(3, 3))
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Icon(
              Icons.sports_baseball,
              color: AppTheme.colors.tennisBall,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.colors.backdrop,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonOutlined extends StatelessWidget {

  final String text;
  final double height;
  final double width;

  final VoidCallback? onClick;

  const ButtonOutlined({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: AppTheme.colors.backdrop,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0x0F000000)),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.5,
              blurRadius: 5,
              offset: Offset(2, 2))
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.colors.amazonGreen,
              ),
            )
          ),
        ),
      ),
    );
  }
}

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
        children:[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
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
                    children:[
                      SizedBox(
                        width: 70,
                        height: 50,
                        child: Text(
                          firstName+'\n'+lastName,
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
                        children:[
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
            children:[
              const SizedBox(width: 5),
              Icon(
                FontAwesomeIcons.whatsapp, 
                color: AppTheme.colors.sandStorm, 
                size: 22.0),
              const SizedBox(width: 15),
              Icon(
                FontAwesomeIcons.instagram, 
                color: AppTheme.colors.sandStorm, 
                size: 22.0),
              const SizedBox(width: 15),
              Icon(
                FontAwesomeIcons.facebookF, 
                color: AppTheme.colors.sandStorm, 
                size: 20.0),
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
            padding: const EdgeInsets.only(left: 3, right: 5, ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Icon(
                  Icons.watch_later,
                  color: AppTheme.colors.sandStorm,  
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
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