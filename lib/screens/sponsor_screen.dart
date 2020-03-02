import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SponsorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.all(10.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('sponsors').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container(
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
                  'Loading...',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Product Sans',
                  ),
                ),
              );
            default:
              return snapshot.data.documents.isEmpty
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
                        'We\'ll get back to you soon.',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Product Sans',
                        ),
                      ),
                    )
                  : new ListView(
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: mediaQuery.size.width * 0.15),
                          // width: mediaQuery.size.width * 0.2,
                          height: mediaQuery.size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              document['imgUrl'],
                              // 'https://upload.wikimedia.org/wikipedia/commons/1/1e/The_Jeevan_Bharati_building_at_Connaught_Place%2C_New_Delhi.jpg',
                              fit: BoxFit.cover,
                              // width: mediaQuery.size.width * 0.1,
                              alignment: Alignment(0.0, -0.3),
                            ),
                          ),
                        );
                      }).toList(),
                    );
          }
        },
      ),
    );
  }
}
