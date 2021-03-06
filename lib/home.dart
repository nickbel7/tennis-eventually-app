import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';
import 'package:faker/faker.dart';
import 'package:tennis_app/home_opponent.dart';
import 'package:tennis_app/home_booking.dart';
import 'package:tennis_app/widgets/buttons.dart';
import 'package:tennis_app/widgets/player_widgets.dart';
import 'package:tennis_app/widgets/data_tiles.dart';
import 'package:tennis_app/profile.dart';

class HomePage extends StatefulWidget {
  final Function(Booking newB)? notifyParent;

  const HomePage({
    Key? key,
    this.notifyParent,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addedBooking(Booking newBooking) {
    widget.notifyParent!(newBooking);
  }

  void _pushBooking() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
              backgroundColor: AppTheme.colors.grassGreen,
              centerTitle: true,
              title: const Text(
                'Tennis EveNTUAlly',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: HomeBookingPage(
              notifyParent: _addedBooking,
            ),
          );
        },
      ),
    );
  }

  void _pushOpponent() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: AppTheme.colors.grassGreen,
          centerTitle: true,
          title: const Text(
            'Tennis EveNTUAlly',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: const HomeOpponentPage(),
      );
    }));
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
            children: <Widget>[
              IconButtonCustom(
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
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
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
                    var firstName = faker.person.firstName();
                    var lastName = faker.person.lastName();
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Scaffold(
                            appBar: AppBar(
                              toolbarHeight: 60,
                              backgroundColor: AppTheme.colors.grassGreen,
                              centerTitle: true,
                              title: const Text('Tennis EveNTUAlly',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            body: ProfilePage(
                              isEditable: false,
                              firstName: firstName,
                              lastName: lastName,
                            ),
                          );
                        }));
                      },
                      child: PlayerCard(
                        firstName: firstName,
                        lastName: lastName,
                      ),
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
                ))),
      ],
    );
  }
}
