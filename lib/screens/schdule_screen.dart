import 'package:flutter/material.dart';

import '../widgets/schedule_table1.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Day1'),
    Tab(text: 'Day2'),
  ];

  TabController _tabController;
  var _index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _selectTab(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            tabs: myTabs,
            onTap: _selectTab,
          ),
          SizedBox(
            height: 20,
          ),
          // FittedBox(
          //   child: Container(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: 20,
          //       vertical: 5,
          //     ),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: Colors.blue,
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: <Widget>[
          //         Text(
          //           'Event',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 20,
          //           ),
          //         ),
          //         SizedBox(
          //           width: 10,
          //         ),
          //         Container(
          //           height: 30,
          //           width: 1,
          //           color: Colors.white,
          //         ),
          //         SizedBox(
          //           width: 10,
          //         ),
          //         Text(
          //           'Time',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 20,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          ScheduleTable1(_index),
          // Expanded(
          //   child: ScheduleTable1(_index),
          // ),
          // SingleChildScrollView(
          //   child: TabBarView(
          //     controller: _tabController,
          //     children: myTabs.map((tab) {
          //       final String label = tab.text;
          //       return Center(
          //         child: Text('This is $label'),
          //       );
          //     }).toList(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
