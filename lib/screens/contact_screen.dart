import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatelessWidget {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final key = new GlobalKey<ScaffoldState>();
    final size = 24.0;
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Asset2.png'),
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Contact Us',
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      decoration: TextDecoration.underline,
                    ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.05),
              Text(
                'You directly call us at:',
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: size,
                    ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.03),
              Text(
                'Indranil Palit',
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: size,
                    ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.01),
              Text(
                '(+91) 84206 72366',
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: size,
                    ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.01),
              Text(
                'Also, you can drop an email at:',
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: size,
                    ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.01),
              GestureDetector(
                child: Text(
                  'exabyte@sxccal.edu',
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontSize: size,
                        decoration: TextDecoration.underline,
                      ),
                ),
                onLongPress: () {
                  Clipboard.setData(
                      new ClipboardData(text: 'exabyte@sxccal.edu'));
                  key.currentState.showSnackBar(new SnackBar(
                    content: new Text("Copied to Clipboard"),
                  ));
                },
              ),
              SizedBox(height: mediaQuery.size.height * 0.03),
              Text(
                'Check out our website:',
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: size,
                    ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.01),
              GestureDetector(
                child: Text(
                  'exabyte.sxccal.edu',
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontSize: size,
                        decoration: TextDecoration.underline,
                      ),
                ),
                onTap: () => _launchURL('http://exabyte.sxccal.edu/'),
              ),
              SizedBox(height: mediaQuery.size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                    onPressed: () {
                      _launchURL('https://www.facebook.com/exabytesxc/');
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                    onPressed: () {
                      _launchURL('https://www.instagram.com/exabytesxc/');
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                    onPressed: () {
                      _launchURL('https://twitter.com/SXCExabyte?s=08');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
