import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tennis_app/theme/app_theme.dart';
import 'package:tennis_app/widgets/buttons.dart';
import 'package:tennis_app/widgets/inputs.dart';
import 'package:tennis_app/widgets/data_tiles.dart';

class HomeBookingPage extends StatefulWidget {
  const HomeBookingPage({Key? key, List<CourtCardWidget>? courtSlots})
      : super(key: key);

  @override
  State<HomeBookingPage> createState() => _HomeBookingPageState();
}

class _HomeBookingPageState extends State<HomeBookingPage> {
  final _courtSlots = <CourtSlot>[
    CourtSlot(
      timeSlot: '13:00-14:00',
      court1: Court(available: true, selected: false, title: 'Court 1'),
      court2: Court(available: true, selected: false, title: 'Court 2'),
    ),
    CourtSlot(
      timeSlot: '15:00-16:00',
      court1: Court(available: true, selected: false, title: 'Court 1'),
      court2: Court(available: true, selected: false, title: 'Court 2'),
    ),
  ];

  bool existsSelectedCourt = false;
  CourtSlot? selectedCourtSlot;

  void _popBooking() {
    if (existsSelectedCourt) {
      Navigator.pop(context);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Nice ! Your court is booked'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  void _tappedCourt(slotInstance, idx) {
    // idx is not really needed, flutter uses the same instance of CourtSlot

    setState(() {
      if (existsSelectedCourt && selectedCourtSlot != slotInstance) {
        selectedCourtSlot!.court1.selected = false;
        selectedCourtSlot!.court2.selected = false;
      }

      // _courtSlots[idx] = slotInstance;
      existsSelectedCourt =
          (slotInstance.court1.selected || slotInstance.court2.selected
              ? true
              : false);
      selectedCourtSlot = (existsSelectedCourt ? slotInstance : null);
    });
  }

  Widget _buildCourtSlots() {
    return ListView.builder(
      itemCount: _courtSlots.length,
      itemBuilder: (context, index) {
        return CourtCardWidget(
          notifyParent: _tappedCourt,
          currentSlot: _courtSlots[index],
          slotIndex: index,
        );
      },
    );
  }

  // DEPRICATED
  // _courtCardBuilder() {
  //   return List.generate(
  //     3,
  //     (index) => CourtCardWidget(
  //       notifyParent: tappedCourt,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DatePickerWidget(),
          Text('Available Slots',
              style: TextStyle(
                color: AppTheme.colors.totallyBlack,
                fontSize: 20,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(height: 5),
          Expanded(
            child: _buildCourtSlots(),
            // child: ListView(
            // children: _courtCardBuilder(),
            // children: <Widget>[
            //   CourtCardWidget(
            //     notifyParent: tappedCourt,
            //   ),
            //   CourtCardWidget(
            //     notifyParent: tappedCourt,
            //   ),
            //   CourtCardWidget(
            //     notifyParent: tappedCourt,
            //   ),
            //   CourtCardWidget(
            //     notifyParent: tappedCourt,
            //   ),
            //   CourtCardWidget(
            //     notifyParent: tappedCourt,
            //   ),
            //   CourtCardWidget(
            //     notifyParent: tappedCourt,
            //   ),
            // ],
            // ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SimpleButton(
              fillcolor: (existsSelectedCourt
                  ? AppTheme.colors.amazonGreen
                  : AppTheme.colors.grassGreen),
              textcolor: AppTheme.colors.sandStorm,
              text: 'BOOK COURT',
              width: 204,
              height: 36,
              onClick: _popBooking,
            ),
          ),
        ],
      ),
    );
  }
}
