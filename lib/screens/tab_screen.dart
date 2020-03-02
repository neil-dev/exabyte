import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './team_screen.dart';
import './schdule_screen.dart';
import './events_screen.dart';
import './home_screen.dart';
import './sponsor_screen.dart';

class TabScreen extends KFDrawerContent {
  TabScreen({
    Key key,
  });
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': Home(),
      'title': 'Home',
    },
    {
      'page': EventScreen(),
      'title': 'Events',
    },
    {
      'page': ScheduleScreen(),
      'title': 'Schedule',
    },
    {
      'page': TeamScreen(),
      'title': 'Team eXabyte',
    },
    {
      'page': SponsorScreen(),
      'title': 'Sponsors',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: widget.onMenuPressed,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[850],
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.blue,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.grey[850],
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.grey[850],
            icon: Icon(FontAwesomeIcons.trophy, size: 18,),
            title: Text('Events'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.grey[850],
            icon: Icon(Icons.calendar_today),
            title: Text('Schedule'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.grey[850],
            icon: Icon(Icons.person),
            title: Text('Team'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.grey[850],
            icon: Icon(Icons.business_center),
            title: Text('Sponsors'),
          ),
        ],
      ),
    );
  }
}
