import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';
import 'package:tennis_app/widgets/headers.dart';
import 'package:tennis_app/widgets/data_tiles.dart';

class BookingsPage extends StatefulWidget {
  
  final Booking? newBooking;

  const BookingsPage({
    Key? key,
    this.newBooking,
  }) : super(key: key);

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {

  // ALL BOOKINGS
  final _bookings = List.generate(
    15, 
    (index) => Booking(
      // DateTime.parse('2020-01-02 03:04:05');
      dateTime: DateTime.parse('2022-03-20 03:04:00'),
      day: '19/03/2022', 
      hour: '18:00-19:00', 
      court: 'Court 1'),
  );

  final _currentBookings = <Booking> [];
  final _previousBookings = <Booking> [];

  // Sets appart the current from the previous bookings in 2 separate lists
  @override
  void initState() {
    super.initState();

    for (var element in _bookings) {
      if (element.dateTime!.isAfter(DateTime.now())) {
        _currentBookings.add(element);
      } else {
        _previousBookings.add(element);
      }
    }
    _currentBookings.add(Booking(
      // DateTime.parse('2020-01-02 03:04:05');
      dateTime: DateTime.parse('2022-04-22 03:04:00'),
      day: '22/03/2022', 
      hour: '14:00-15:00', 
      court: 'Court 2'),
    );

    if (widget.newBooking != null) {
      _currentBookings.add(widget.newBooking!);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildCurrentBookings() {
    return ListView.builder(
      itemCount: _currentBookings.length,
      shrinkWrap: true,                   // the list view only occupies the space it needs
      itemBuilder: (context, index) {
        return BookingRow(
          day: _currentBookings[index].day,
          time: _currentBookings[index].hour,
          court: _currentBookings[index].court,
          bgColor: AppTheme.colors.amazonGreen,
          fontColor: AppTheme.colors.sandStorm,
        );
      },
    );
  }

  Widget _buildPreviousBookings() {
    return ListView.builder(
      itemCount: _previousBookings.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return BookingRow(
          day: _previousBookings[index].day,
          time: _previousBookings[index].hour,
          court: _previousBookings[index].court,
          bgColor: AppTheme.colors.grassGreen,
          fontColor: AppTheme.colors.totallyBlack,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25,),
      child: Column(
        children: <Widget>[
          Visibility(
            visible: (_currentBookings.isEmpty ? false : true),
            child: const SectionHeader(
              header: "Current"
            ),
          ),
          Container(
            // height: 50,
            child: _buildCurrentBookings(),
          ),
          Visibility(
            visible: (_previousBookings.isEmpty ? false : true),
            child: const SectionHeader(
              header: "Previous"
            ),
          ),
          Expanded(
            child: _buildPreviousBookings(),
          ),
        ],
      ),
    );
  }
}