import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../screens/event_description_screen.dart';
import '../providers/event.dart';

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context, listen: false);
    final mediaQuery = MediaQuery.of(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => EventDescription(event),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff5a5a5a),
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Hero(
                tag: event.id,
                child: Image.asset(
                  event.imageUrl,
                  fit: BoxFit.cover,
                  height: mediaQuery.size.height * 0.24,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        event.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Caviar Dreams',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.subtitle.color,
                        ),
                      ),
                      SizedBox(width: mediaQuery.size.width * 0.005),
                      Icon(
                        Icons.timer,
                        color: Theme.of(context).textTheme.subtitle.color,
                      ),
                      Text(
                        event.duration,
                        style: TextStyle(
                          // fontFamily: 'Caviar Dreams',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.subtitle.color,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Consumer<Event>(
                        builder: (ctx, event, _) => IconButton(
                          icon: Icon(
                            event.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            event.toggleFavoriteStatus(event.id);
                          },
                        ),
                      ),
                      SizedBox(width: 5),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          Share.share(event.link);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
