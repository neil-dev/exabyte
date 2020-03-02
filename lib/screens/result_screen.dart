import './result_console.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        // width: mediaQuery.size.width * 0.8,
        margin: EdgeInsets.symmetric(
            vertical: mediaQuery.size.height * 0.005, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff5a5a5a),
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        // height: mediaQuery.size.height * 0.6,
        // child: Text('Hello'),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Color(0xff464955),
              ),
              height: 30,
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfff56060),
                    ),
                    height: 14,
                    width: 14,
                  ),
                  SizedBox(width: 3),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfffbfb76),
                    ),
                    height: 14,
                    width: 14,
                  ),
                  SizedBox(width: 3),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff7ef77e),
                    ),
                    height: 14,
                    width: 14,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Terminal',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Expanded(
              // height: mediaQuery.size.height * 0.5,
              child: ResultConsole(),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
