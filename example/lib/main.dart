import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it_future_builder/get_it_future_builder.dart';
import 'package:get_it_future_builder_example/locators.dart';

void main() {
  initLocator();
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
          //-----------------------------------//
          // Example for single future builder //
          //-----------------------------------//
          Column(
            children: [
              Text(
                'Application Documents Directory',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              GetItFutureBuilder<Directory>(
                instanceName: 'documents_dir', // optional
                loading: (context) => const LinearProgressIndicator(),
                ready: (context, instance) => Text(
                  'Documents directory: ${instance.path}',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          //------------------------------//
          // Example for future builder 2 //
          //------------------------------//
          Column(
            children: [
              Text(
                'Two Dependencies',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              GetItFutureBuilder2<Directory, Directory>(
                instanceName1: 'temp_dir', // optional
                instanceName2: 'support_dir', // optional
                loading: (context) => const LinearProgressIndicator(),
                ready: (context, instance1, instance2) => Text(
                  'Temporary dir is ${instance1.path} and support dir is '
                  '${instance2.path}.',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          //------------------------------//
          // Example for future builder 3 //
          //------------------------------//
          Column(
            children: [
              Text(
                'Three Depenencies',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              GetItFutureBuilder3<Directory, Directory, Directory>(
                instanceName1: 'temp_dir', // optional
                instanceName2: 'support_dir', // optional
                instanceName3: 'documents_dir',
                loading: (context) => const LinearProgressIndicator(),
                ready: (context, instance1, instance2, instance3) => Text(
                  'Temporary dir is ${instance1.path}, support dir is '
                  '${instance2.path} and documents dir is ${instance3.path}.',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
