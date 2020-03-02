import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String post;
  final String contact;

  TeamCard(
    this.name,
    this.post,
    this.contact,
    this.imgUrl,
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[850],
      ),
      height: mediaQuery.size.height * 0.5,
      width: mediaQuery.size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // SizedBox(
          //   height: mediaQuery.size.height * .05,
          // ),
          // CircleAvatar(
          //   radius: mediaQuery.size.height * .12,
          //   child: Image.asset(
          //     imgUrl,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // SizedBox(
          //   height: mediaQuery.size.height * .05,
          // ),
          Container(
            width: mediaQuery.size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset(
                imgUrl,
                fit: BoxFit.cover,
                alignment: Alignment(0.0, -0.3),
              ),
            ),
            height: mediaQuery.size.height * 0.3,
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: mediaQuery.size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              // color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Product Sans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  post,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Product Sans',
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    Text(
                      contact,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Product Sans',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
