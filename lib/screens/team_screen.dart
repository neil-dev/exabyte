import 'package:flutter/material.dart';

import '../widgets/team_card.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final controller = PageController();
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: mediaQuery.size.height * .07,
      ),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            'Our Team',
            style: TextStyle(
                color: Colors.amber,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Caviar Dreams'),
          ),
          SizedBox(
            height: mediaQuery.size.height * .04,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                TeamCard('Indranil Palit', 'Convenor', '+91 84206 72366',
                    'assets/images/palit.jpg'),
                TeamCard('Sirshendu Ganguly', 'Working Committee Member',
                    '+91 83360 60365', 'assets/images/sirshu.jpg'),
                TeamCard('Shreya Banerjee', 'Working Committee Member',
                    '+91 80177 69127', 'assets/images/shreya.jpg'),
                TeamCard('Ajoy Das', 'Working Committee Member',
                    '+91 86974 14299', 'assets/images/ashok.jpg'),
                TeamCard('Rush Guha', 'Working Committee Member',
                    '+91 82405 64741', 'assets/images/rush.jpg'),
                TeamCard('Suvranil Dutta Biswas', 'App Developer',
                    '+91 96744 29152', 'assets/images/profile.jpeg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
