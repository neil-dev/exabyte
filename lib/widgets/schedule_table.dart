import 'package:flutter/material.dart';

import '../models/schedule_info.dart';

class ScheduleTable extends StatelessWidget {
  final int _index;

  ScheduleTable(this._index);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      padding: EdgeInsets.all(20),
      // child: Text('Hello'),
      child: Table(
        // border: TableBorder.all(
        // width: 1, style: BorderStyle.solid, color: Colors.blue),
        columnWidths: {
          0: FractionColumnWidth(0.4),
          1: FractionColumnWidth(0.6),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: schedule[_index].map((itr) {
          return TableRow(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  itr['event'],
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  itr['time'],
                  style: TextStyle(
                    // color: Colors.blue,
                    color: Color(0xccffffff),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
