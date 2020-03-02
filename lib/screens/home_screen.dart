import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  final _images = const [
    'assets/images/stage.JPG',
    'assets/images/audi.JPG',
    'assets/images/code.jpg',
    'assets/images/deb.jpg',
    'assets/images/sa.JPG',
  ];

  final _exabyteText =
      'In this current accelerating society, only one thing remains un-changeable – CHANGE.\nWe never know what technology tomorrow will gift us. Hence in this changing world, we affirm to align ourselves with the changing times and try to get a glimpse of what future would be like.\n\nWe, at the Department of Computer Science of St. Xavier’s College (Autonomous), Kolkata, bring to you "eXabyte 2020 – Exploring the Impossibilities" on the 19th and 20th of February, 2020. As an exemplar to showcase our eminence in the world of technology, we strive to bring together future legionaries of the technological arena and kindle in them a thirst for answers, quest for horizons.';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: mediaQuery.size.height * 0.05),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Asset2.png'),
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              // height: 400,
              height: mediaQuery.size.height * 0.7,
              items: _images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: mediaQuery.size.width * 0.7,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
                        child: Image.asset(
                          i,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'eXabyte 5.0',
                style: TextStyle(
                  fontFamily: 'Caviar Dreams',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Exploring the Impossibilities',
                style: TextStyle(
                  color: Colors.white70,
                  fontFamily: 'Caviar Dreams',
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '"Understand well as I may, my comprehension can only be an infinitesimal fraction of all I want to understand."\n- Ada Lovelace',
                  style: TextStyle(
                    fontFamily: 'Dancing Script',
                    fontWeight: FontWeight.w500,
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  height: 50,
                  width: 5,
                  color: Colors.amber,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'About Exabyte',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontSize: 35),
                    ),
                    Container(
                      height: 5,
                      width: 230,
                      // color: Colors.white,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(158, 158, 158, 1.0),
                            Color.fromRGBO(0, 0, 0, 1.0)
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _exabyteText,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: <Widget>[
            //     Container(
            //       margin: EdgeInsets.only(
            //         left: 20,
            //         right: 10,
            //       ),
            //       height: 50,
            //       width: 5,
            //       color: Colors.amber,
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Text(
            //           'About X-Cryptus',
            //           style: TextStyle(
            //             fontSize: 35,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         Container(
            //           height: 5,
            //           width: 230,
            //           // color: Colors.white,
            //           decoration: BoxDecoration(
            //             gradient: LinearGradient(
            //               begin: Alignment.topLeft,
            //               end: Alignment.bottomRight,
            //               colors: [
            //                 Color.fromRGBO(158, 158, 158, 1.0),
            //                 Color.fromRGBO(0, 0, 0, 1.0)
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     _xcryptusText,
            //     style: TextStyle(
            //       fontSize: 20,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
