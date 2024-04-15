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

  @override
  void initState() {
    super.initState();
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
              setState(() {
                futureActivity = apiService.fetchData();
              });
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
              String activity = snapshot.data!.activity;
              return Text(
                activity,
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
