import 'package:empat_project_07/bored_activity.dart';
import 'package:flutter/material.dart';

import 'API_service.dart';

class Bored extends StatefulWidget {
  const Bored({super.key});

  @override
  State<Bored> createState() => _BoredState();
}

class _BoredState extends State<Bored> {
  final ApiService apiService = ApiService();
  late Future<BoredActivity> futureActivity;
  late BoredActivity displayedActivity;

  @override
  void initState() {
    super.initState();
    displayedActivity = BoredActivity(
      activity: 'Press the button to get activity',
      type: '',
      participants: 0,
      price: 0.0,
      link: '',
      key: '',
      accessibility: 0.0,
    );
    futureActivity = apiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              apiService.fetchData().then((activity) {
                setState(() {
                  displayedActivity = activity;
                });
              }).catchError((error) {});
            },
            child: const Text('Random Activity'),
          ),
          const SizedBox(height: 20),
          FutureBuilder<BoredActivity>(
            future: futureActivity,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return Text(
                displayedActivity.activity,
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              );
            },
          ),
        ],
      ),
    );
  }
}
