import 'package:flutter/material.dart';

class ConsoleText extends StatefulWidget {
  final int index;

  ConsoleText(this.index);

  @override
  _ConsoleTextState createState() => _ConsoleTextState();
}

class _ConsoleTextState extends State<ConsoleText>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _cursorController;
  final List<String> text = [
    'echo \$letsGetStarted',
    '\neXabyte TimeTable\n',
    'ls -all Events\n'
  ];
  // int index = widget.index;
  final day1 = [
    ['.OPENING_CEREMONY', 'Feb 19', '10:00', '/Auditorium'],
    ['.DIGI-TECH_SEMINAR', 'Feb 19', '11:45', '/Auditorium'],
    ['.ROBOLT', 'Feb 19', '13:00', '/ComputerLab4'],
    ['.CODEPLAY', 'Feb 19', '13:00', '/ComputerLab1'],
    ['.PITCH-TO-RICH', 'Feb 19', '13:00', '/SmartClassroom'],
    ['.CUBEX', 'Feb 19', '13:00', '/JubileeHall'],
    ['.VERB-O-WAR', 'Feb 19', '13:00', '/R.K.Hall'],
    ['.DIGIBIT', 'Feb 19', '13:00', '/Room44'],
    ['.SNAPPIT', 'Feb 19', '13:00', '/BigParlour'],
    ['.WEBBED', 'Feb 19', '15:00', '/ComputerLab2'],
    ['.CRYPT-X', 'Feb 19', '14:45', '/ComputerLab4'],
  ];
  final day2 = [
    ['.BRAINSTORM', 'Feb 20', '10:00', '/R.K.Hall'],
    ['.CODEPLAY(FINALS)', 'Feb 20', '10:00','/ComputerLab4'],
    ['.EM-BLEED', 'Feb 20', '11:00', '/BMM_Lab3'],
    ['.BOX-TO-BOX', 'Feb 20', '10:30', '/BigParlour'],
    ['.CLOSING_CEREMONY', 'Feb 20', '13:00', '/Auditorium'],
  ];

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 20000));
    _cursorController = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _cursorController.repeat();
    // setState(() {
    //   _characterCount = new StepTween(begin: 0, end: text[index].length)
    //       .animate(
    //           new CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    // });
    // print(_characterCount.value);
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
    // timeDilation = 10;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Asset2.png'),
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(5),
      alignment: Alignment.topLeft,
      child: StaggerAnimation(
        controller: _controller,
        text: text,
        cursor: _cursorController,
        day: widget.index == 0 ? day1 : day2,
      ),
      // child: _characterCount == null
      //     ? Text('null')
      //     : Row(
      //         children: <Widget>[
      //           Text(
      //             'events@eXabyte2020',
      //             style: TextStyle(
      //               color: Color(0xff50ffef),
      //               fontFamily: 'Ubuntu Mono',
      //               fontWeight: FontWeight.bold,
      //               fontSize: size,
      //             ),
      //           ),
      //           Text(
      //             ':~ \$ ',
      //             style: TextStyle(
      //               fontFamily: 'Ubuntu Mono',
      //               fontWeight: FontWeight.bold,
      //               fontSize: size,
      //             ),
      //           ),
      //           new AnimatedBuilder(
      //             animation: _characterCount,
      //             builder: (BuildContext context, Widget child) {
      //               String _currentText =
      //                   text[0].substring(0, _characterCount.value);
      //               return new Text(
      //                 _currentText,
      //                 style: TextStyle(
      //                   fontFamily: 'Ubuntu Mono',
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: size,
      //                 ),
      //               );
      //             },
      //           ),
      //         ],
      //       ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller, this.text, this.cursor, this.day})
      :

        // Each animation defined here transforms its value during the subset
        // of the controller's duration defined by the animation's interval.
        // For example the opacity animation transforms its value during
        // the first 10% of the controller's duration.

        _echo = new StepTween(begin: 0, end: text[0].length).animate(
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

  // opacity = Tween<double>(
  //   begin: 0.0,
  //   end: 1.0,
  // ).animate(
  //   CurvedAnimation(
  //     parent: controller,
  //     curve: Interval(
  //       0.0, 0.100,
  //       curve: Curves.ease,
  //     ),
  //   ),
  // ),

  // ... Other tween definitions ...

  // super(key: key);

  final Animation<double> controller;
  final Animation<double> cursor;
  final Animation<int> _echo;
  final Animation<int> _heading;
  final Animation<int> _eventHeading;
  final Animation<int> _eventList;
  // final Animation<double> width;
  // final Animation<double> height;
  // final Animation<EdgeInsets> padding;
  // final Animation<BorderRadius> borderRadius;
  // final Animation<Color> color;

  final List<String> text;
  final List<List<String>> day;
  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context, Widget child) {
    final double size = 20;
    final double spacing = 10;
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
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (_heading.value != 0)
                AnimatedBuilder(
                  animation: _heading,
                  builder: (BuildContext context, Widget child) {
                    // String _currentText = text[1];
                    // return _heading.value == 0
                    //     ? null
                    //     : Text(
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
                    // String _currentText = text[1];
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
                      // '',
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
            AnimatedBuilder(
              animation: _eventList,
              builder: (BuildContext context, Widget child) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: day.length,
                  itemBuilder: (ctx, i) => Wrap(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(
                        width: 190,
                        child: Text(
                          day[i][0],
                          style: TextStyle(
                            color: Color(0xfffff35e),
                            fontFamily: 'Ubuntu Mono',
                            fontWeight: FontWeight.bold,
                            fontSize: size,
                          ),
                        ),
                      ),
                      SizedBox(width: spacing),
                      Text(
                        day[i][1],
                        style: TextStyle(
                          color: Color(0xffff50f1),
                          fontFamily: 'Ubuntu Mono',
                          fontWeight: FontWeight.bold,
                          fontSize: size,
                        ),
                      ),
                      SizedBox(width: spacing),
                      Text(
                        day[i][2],
                        style: TextStyle(
                          color: Color(0xff76ff03),
                          fontFamily: 'Ubuntu Mono',
                          fontWeight: FontWeight.bold,
                          fontSize: size,
                        ),
                      ),
                      SizedBox(width: spacing),
                      Text(
                        day[i][3],
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Ubuntu Mono',
                          fontWeight: FontWeight.bold,
                          fontSize: size,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
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
                    // String _currentText = text[1];
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
    // return Container(
    //   padding: padding.value,
    //   alignment: Alignment.bottomCenter,
    //   child: Opacity(
    //     opacity: opacity.value,
    //     child: Container(
    //       width: width.value,
    //       height: height.value,
    //       decoration: BoxDecoration(
    //         color: color.value,
    //         border: Border.all(
    //           color: Colors.indigo[300],
    //           width: 3.0,
    //         ),
    //         borderRadius: borderRadius.value,
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
