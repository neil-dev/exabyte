import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Event with ChangeNotifier {
  final String id;
  final String name;
  final List<bool> date;
  final String duration;
  final String imageUrl;
  final String link;
  final String description;
  bool isFavorite;

  Event({
    @required this.id,
    @required this.name,
    @required this.date,
    @required this.duration,
    @required this.imageUrl,
    @required this.link,
    @required this.description,
    this.isFavorite = false,
  });

  // void _setFavValue(bool newValue) {
  //   isFavorite = newValue;
  //   notifyListeners();
  // }

  // Future<void> getFav(String id, Event event) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.containsKey(id)) {
  //     event.isFavorite = prefs.getBool(id);
  //     notifyListeners();
  //   }
  // }

  Future<void> toggleFavoriteStatus(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool status;
    // final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    if (prefs.containsKey(id)) {
      status = prefs.getBool(id);
      // print('#1$status');
    } else {
      status = false;
    }
    status = isFavorite;
    await prefs.setBool(id, status);
    // print('#2$status');
  }
}
