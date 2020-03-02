import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResultConsole extends StatefulWidget {
  @override
  _ResultConsoleState createState() => _ResultConsoleState();
}

class _ResultConsoleState extends State<ResultConsole>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _cursorController;
  final List<String> text = [
    'echo \$results',
    '\neXabyte Results\n',
    'ls -all Results\n'
  ];
  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 20000));
    _cursorController = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _cursorController.repeat();

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Asset2.png'),
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(5),
      alignment: Alignment.topLeft,
      child: StaggerAnimation(
        controller: _controller,
        text: text,
        cursor: _cursorController,
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller, this.text, this.cursor})
      : _echo = new StepTween(begin: 0, end: text[0].length).animate(
          new CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.1,
              curve: Curves.easeIn,
            ),
          ),
        ),
        _heading = new StepTween(begin: 0, end: text[1].length).animate(
          new CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.12,
              0.12,
              curve: Curves.easeIn,
            ),
          ),
        ),
        _eventHeading = new StepTween(begin: 0, end: text[2].length).animate(
          new CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.15,
              0.25,
              curve: Curves.easeIn,
            ),
          ),
        ),
        _eventList = new StepTween(begin: 0, end: text[1].length).animate(
          new CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3,
              0.3,
              curve: Curves.easeIn,
            ),
          ),
        );

  final Animation<double> controller;
  final Animation<double> cursor;
  final Animation<int> _echo;
  final Animation<int> _heading;
  final Animation<int> _eventHeading;
  final Animation<int> _eventList;

  final List<String> text;

  Widget _buildAnimation(BuildContext context, Widget child) {
    final double size = 20;
    final double spacing = 10;
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Wrap(
            children: <Widget>[
              Text(
                'events@eXabyte2020',
                style: TextStyle(
                  color: Color(0xff50ffef),
                  fontFamily: 'Ubuntu Mono',
                  fontWeight: FontWeight.bold,
                  fontSize: size,
                ),
              ),
              Text(
                ':~ \$ ',
                style: TextStyle(
                  fontFamily: 'Ubuntu Mono',
                  fontWeight: FontWeight.bold,
                  fontSize: size,
                ),
              ),
              new AnimatedBuilder(
                animation: _echo,
                builder: (BuildContext context, Widget child) {
                  String _currentText = text[0].substring(0, _echo.value);
                  return new Text(
                    _currentText,
                    style: TextStyle(
                      fontFamily: 'Ubuntu Mono',
                      fontWeight: FontWeight.bold,
                      fontSize: size,
                    ),
                  );
                },
              ),
            ],
          ),
          AnimatedBuilder(
            animation: _heading,
            builder: (BuildContext context, Widget child) {
              String _currentText = text[1];
              return Align(
                alignment: Alignment.centerLeft,
                child: _heading.value == 0
                    ? null
                    : Text(
                        _currentText,
                        style: TextStyle(
                          fontFamily: 'Ubuntu Mono',
                          fontWeight: FontWeight.bold,
                          fontSize: size,
                        ),
                      ),
              );
            },
          ),
          Wrap(
            children: <Widget>[
              if (_heading.value != 0)
                AnimatedBuilder(
                  animation: _heading,
                  builder: (BuildContext context, Widget child) {
                    return Text(
                      'events@eXabyte2020',
                      style: TextStyle(
                        color: Color(0xff50ffef),
                        fontFamily: 'Ubuntu Mono',
                        fontWeight: FontWeight.bold,
                        fontSize: size,
                      ),
                    );
                  },
                ),
              if (_heading.value != 0)
                AnimatedBuilder(
                  animation: _heading,
                  builder: (BuildContext context, Widget child) {
                    return Text(
                      ':~ \$ ',
                      style: TextStyle(
                        fontFamily: 'Ubuntu Mono',
                        fontWeight: FontWeight.bold,
                        fontSize: size,
                      ),
                    );
                  },
                ),
              if (_eventHeading.value != 0)
                AnimatedBuilder(
                  animation: _eventHeading,
                  builder: (BuildContext context, Widget child) {
                    String _currentText =
                        text[2].substring(0, _eventHeading.value);
                    return new Text(
                      _currentText,
                      style: TextStyle(
                        fontFamily: 'Ubuntu Mono',
                        fontWeight: FontWeight.bold,
                        fontSize: size,
                      ),
                    );
                  },
                ),
            ],
          ),
          if (_eventList.value != 0)
            StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('results').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  return AnimatedBuilder(
                      animation: _eventList,
                      builder: (BuildContext context, Widget child) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Text(
                              'Loading...',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Ubuntu Mono',
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          default:
                            return snapshot.data.documents.isEmpty
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'We\'ll get back to you soon.',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Ubuntu Mono',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    children: snapshot.data.documents
                                        .map((DocumentSnapshot document) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 190,
                                            child: Text(
                                              '.${document['event']}',
                                              style: TextStyle(
                                                color: Color(0xfffff35e),
                                                fontFamily: 'Ubuntu Mono',
                                                fontWeight: FontWeight.bold,
                                                fontSize: size,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '#1/${document['Winner1']}',
                                            style: TextStyle(
                                              color: Color(0xffff50f1),
                                              fontFamily: 'Ubuntu Mono',
                                              fontWeight: FontWeight.bold,
                                              fontSize: size,
                                            ),
                                          ),
                                          Text(
                                            '#2/${document['Winner2']}',
                                            style: TextStyle(
                                              color: Color(0xff76ff03),
                                              fontFamily: 'Ubuntu Mono',
                                              fontWeight: FontWeight.bold,
                                              fontSize: size,
                                            ),
                                          ),
                                          SizedBox(height: spacing),
                                        ],
                                      );
                                    }).toList(),
                                  );
                        }
                      });
                }),
          SizedBox(height: 20),
          if (_eventList.value != 0)
            Row(
              children: <Widget>[
                AnimatedBuilder(
                  animation: _heading,
                  builder: (BuildContext context, Widget child) {
                    return Text(
                      'events@eXabyte2020',
                      style: TextStyle(
                        color: Color(0xff50ffef),
                        fontFamily: 'Ubuntu Mono',
                        fontWeight: FontWeight.bold,
                        fontSize: size,
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _heading,
                  builder: (BuildContext context, Widget child) {
                    return Text(
                      ':~ \$ ',
                      style: TextStyle(
                        fontFamily: 'Ubuntu Mono',
                        fontWeight: FontWeight.bold,
                        fontSize: size,
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _eventList,
                  builder: (BuildContext context, Widget child) {
                    return FadeTransition(
                      opacity: cursor,
                      child: Container(
                        height: size,
                        width: 6,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
