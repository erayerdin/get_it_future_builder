import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it_future_builder/get_it_future_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get It Future Builder Example'),
        elevation: 4,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Column(
            children: [
              Text(
                'Application Documents Directory',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              GetItFutureBuilder<Directory>(
                // `instanceName` is optional
                loading: (context) => const LinearProgressIndicator(),
                ready: (context, instance) =>
                    Text('Documents directory: ${instance.path}'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
