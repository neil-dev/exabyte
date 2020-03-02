import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/contact_screen.dart';
import '../screens/result_screen.dart';
import '../screens/tab_screen.dart';
import '../screens/bookmark_screen.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  KFDrawerController _drawerController;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: TabScreen(),
      items: [
        KFDrawerItem.initWithPage(
          text: Text(
            'BOOKMARKS',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.bookmark, color: Colors.white),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Bookmarks(),
            ));
          },
          // page: CalendarPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('RULEBOOK', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.book, color: Colors.white),
          onPressed: () => _launchURL('https://drive.google.com/file/d/1UOI6Wy1ZVsCypn40W1uzlQoWUQNmqXDa/view?usp=sharing'),
          // page: TabScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'X-CRYPTUS',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(FontAwesomeIcons.bookOpen, color: Colors.white),
          onPressed: () => _launchURL('https://drive.google.com/drive/folders/1OgtFTHiWva7X5xDav9OgiRWBSqLkDhpW'),
          // page: ClassBuilder.fromString('SettingsPage'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'RESULTS',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(FontAwesomeIcons.penFancy, color: Colors.white),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ResultScreen(),
            ));
          },
          // page: ClassBuilder.fromString('SettingsPage'),
        ),
        // KFDrawerItem.initWithPage(
        //   text: Text(
        //     'CONTACT US',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   icon: Icon(Icons.mail, color: Colors.white),
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //       builder: (BuildContext context) => ContactScreen(),
        //     ));
        //   },
        //   // page: ClassBuilder.fromString('SettingsPage'),
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              'eXabyte 5.0',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Caviar Dreams',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // Image.asset(
            //   'assets/logo.png',
            //   alignment: Alignment.centerLeft,
            // ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'CONTACT US',
            style: TextStyle(color: Colors.white),
          ),
          // icon: Icon(Icons.mail, color: Colors.white),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ContactScreen(),
            ));
          },
          // icon: Icon(
          //   Icons.input,
          //   color: Colors.white,
          // ),
          // onPressed: () {},
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(158, 158, 158, 1.0),
              Color.fromRGBO(0, 0, 0, 1.0)
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
