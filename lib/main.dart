import 'package:flutter/material.dart';
import 'package:tennis_app/home.dart';
import 'package:tennis_app/profile.dart';
import 'package:tennis_app/search.dart';
import 'package:tennis_app/theme/app_theme.dart';
import './bookings.dart';
import 'package:tennis_app/widgets/data_tiles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tennis EveNTUAlly',
      home: const MyHomePage(
        title: 'Tennis EveNTUAlly',
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: AppTheme.colors.backdrop,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // _pages = <Widget>[
      //   HomePage(
      //     notifyParent: _addedBooking,
      //   ),
      //   BookingsPage(
      //     newBooking: _newBooking,
      //   ),
      //   const SearchPage(),
      //   const ProfilePage(),
      // ];
      _pages[1] = BookingsPage(
        newBooking: _newBooking,
      );
    });
  }

  Booking? _newBooking;
  void _addedBooking(Booking newBooking) {
    _newBooking = newBooking;
    print('Added Successfully');
  }

  // List<Widget> _pages() {
  //   return <Widget>[
  //     HomePage(
  //       notifyParent: _addedBooking,
  //     ),
  //     BookingsPage(
  //       newBooking: _newBooking,
  //     ),
  //     const SearchPage(),
  //     const ProfilePage(),
  //   ];
  // }

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      HomePage(
        notifyParent: _addedBooking,
      ),
      BookingsPage(
        newBooking: _newBooking,
      ),
      const SearchPage(),
      const ProfilePage(
        isEditable: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called

    return Scaffold(
      // ==========> APP BAR <=================
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: AppTheme.colors.grassGreen,
        leading: Container(
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ),
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.only(left: 5.0),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      // ==========> BODY <=================
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),

      // ==========> NAVIGATION BAR <=================
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.colors.amazonGreen, // SELECTED TAB COLOR
        unselectedItemColor: const Color(0xCFFFFFFF),
        backgroundColor: AppTheme.colors.grassGreen, // BACKGROUND COLOR
        iconSize: 30,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        elevation: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
