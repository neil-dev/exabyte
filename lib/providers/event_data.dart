import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './event.dart';

class Events with ChangeNotifier {
  List<Event> _events = [
    Event(
      id: 'e1',
      name: 'Codeplay',
      date: [true, true],
      imageUrl: 'assets/images/codeplay.jpeg',
      duration: '2 hrs',
      link: 'https://forms.gle/aXrEgPEENQhCqEMu5',
      description: 'If you see everything in life as a step by step unfolding of a concept, and if you are adept in translating your solutions into various programming languages, then code play is your game. come join us in decrypting codes and solving mind games.',
    ),
    Event(
      id: 'e2',
      name: 'Box-To-Box',
      date: [true, true],
      imageUrl: 'assets/images/fifa.jpg',
      duration: '2.5 hrs',
      link: 'https://forms.gle/Qkc1EesD3aJd6hVc6',
      description: 'Immerse in the madness of football in Box-To-Box, where you must battle out against the best and lead your team to Glory!',
    ),
    Event(
      id: 'e3',
      name: 'Cryptx',
      date: [true, false],
      imageUrl: 'assets/images/cryptx.jpeg',
      duration: '2 hrs',
      link: 'https://forms.gle/diURMtx1FoJExQYP6',
      description: 'If you find yourself intrigued by the concept of secret, messages and the ability to break them into plain text, then Crypt-X, our cryptography event, is tailor-made to suit your curiosity.',
    ),
    Event(
      id: 'e4',
      name: 'Em-bleed',
      date: [false, true],
      imageUrl: 'assets/images/embleed.jpeg',
      duration: '1 hr',
      link: 'https://forms.gle/uWFPBqvrZ5YsTSsA6',
      description: 'Always found yourself fascinated with a larger than life poster? Now you have a chance to create one of your own. we provide the stage for you to showcase your artistic talent and innovative mind.',
    ),
    Event(
      id: 'e5',
      name: 'Brainstrom',
      date: [false, true],
      imageUrl: 'assets/images/quiz.jpeg',
      duration: '2 hrs',
      link: 'https://forms.gle/r3AB6qhRJFH9fj6Z6',
      description: 'From the how to why, from the whom to where, from the what to the when, we aim to fuel your wit, curiosity and quickness of thought through our quiz session named brainstorm.',
    ),
    Event(
      id: 'e6',
      name: 'Webbed',
      date: [true, false],
      imageUrl: 'assets/images/webbed.jpeg',
      duration: '2 hrs',
      link: 'https://forms.gle/NS9hUhk95KMmiNBB8',
      description: 'Are you a tech-savvy soul that can integrate artistic idea with programming techniques? Participate in this web-designing event, to explore your artistic eye through the eye of a machine.',
    ),
    Event(
      id: 'e7',
      name: 'Digibit',
      date: [true, false],
      imageUrl: 'assets/images/digibit.jpeg',
      duration: '3 hrs',
      link: 'https://forms.gle/NRwnXTdvj4ZbQY8b8',
      description: 'Interested in implementing your ideas and concepts with your bare hands? Come participate in Digibit, where we provide the elements and you provide the brain.',
    ),
    Event(
      id: 'e8',
      name: 'Verb-O-War',
      date: [true, false],
      imageUrl: 'assets/images/debate.jpeg',
      duration: '1 hr',
      link: 'https://forms.gle/iFS3Qq78aHThhdFHA',
      description: 'We provide the stage while you provide the voice. Verb-O-War is the place to battle out your ideas and concepts, and enforce the wide spectrum of thought.',
    ),
    Event(
      id: 'e9',
      name: 'Cubex',
      date: [true, false],
      imageUrl: 'assets/images/cubex.jpeg',
      duration: '2 hrs',
      link: 'https://forms.gle/WGHPa7fS29k3w4nZ6',
      description: 'To obtain that one prized state of the rubik\'s cube among 43 quintillion other possible combinations is the ultimate joy of speedcubing. This event brings to you the thrill of speedcubing and a platform to showcase your cubing skills. Battle it out against other cubers with your zest and intelligence!',
    ),
    Event(
      id: 'e10',
      name: 'Ro-bolt',
      date: [true, false],
      imageUrl: 'assets/images/robolt.jpg',
      duration: '3 hrs',
      link: 'https://forms.gle/MzJiuBj6PNf7rRgVA',
      description: 'If you thought that robotics couldn’t get any cooler think again, participate in our robotic race and discover the athlete living underneath your armour of technology.',
    ),
    Event(
      id: 'e11',
      name: 'Snappit',
      date: [true, false],
      imageUrl: 'assets/images/snappit.jpeg',
      duration: '30 mins',
      link: 'https://forms.gle/Xk3MiBKHuyWdckAP7',
      description: 'Do you think you have the vision to paint a story through your captured pictures? If yes, then come and be part of snappit and showcase your photography skills',
    ),
    Event(
      id: 'e12',
      name: 'Pitch To Rich',
      date: [true, false],
      imageUrl: 'assets/images/pitch.jpeg',
      duration: '4 hrs',
      link: 'https://forms.gle/sRKzzrAj25iisFgcA',
      description: 'Do you have an innovative idea which you think will be a gamechanger? Come participate in our start-up challenge and showcase your presentation skills.',
    ),
  ];

  List<Event> get events {
    return [..._events];
  }

  List<Event> get favoriteEvents {
    return events.where((event) => event.isFavorite).toList();
  }

  Future<void> setFav(String id, Event event) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(id)) {
      event.isFavorite = prefs.getBool(id);
      notifyListeners();
    }
  }

  void setFavorite() {
    events.forEach((ev) => setFav(ev.id, ev));
    notifyListeners();
  }

  Events() {
    setFavorite();
  }
}
