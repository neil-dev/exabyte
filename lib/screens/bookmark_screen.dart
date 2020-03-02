import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/event_data.dart';
import '../screens/event_description_screen.dart';

class Bookmarks extends StatelessWidget {
  static const routeName = '/bookmark';
  @override
  Widget build(BuildContext context) {
    final eventsData = Provider.of<Events>(context);
    final fav = eventsData.favoriteEvents;
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('BookMarks'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: fav.isEmpty
          ? Container(
              height: double.infinity,
              width: mediaQuery.size.width * 0.9,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Asset2.png'),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstATop),
                ),
              ),
              child: Text(
                'Add your Favorites here.',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: fav.length,
                itemBuilder: (ctx, i) => InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          EventDescription(fav[i]),
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
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12)),
                          child: Hero(
                            tag: fav[i].id,
                            child: Image.asset(
                              fav[i].imageUrl,
                              fit: BoxFit.cover,
                              height: mediaQuery.size.height * 0.24,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
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
                                    fav[i].name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Caviar Dreams',
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .subtitle
                                          .color,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.timer,
                                    color: Theme.of(context)
                                        .textTheme
                                        .subtitle
                                        .color,
                                  ),
                                  Text(
                                    fav[i].duration,
                                    style: TextStyle(
                                      // fontFamily: 'Caviar Dreams',
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .subtitle
                                          .color,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.share,
                                      color: Colors.white70,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
