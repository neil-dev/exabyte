import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/event_item.dart';
import '../providers/event_data.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventsData = Provider.of<Events>(context);
    final events = eventsData.events;
    // events.forEach((event) => setFav(event.id, event));
    // events.forEach((event) => print('${event.id} ${event.isFavorite}'));
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: events[i],
          child: EventCard(),
        ),
      ),
    );
  }
}
