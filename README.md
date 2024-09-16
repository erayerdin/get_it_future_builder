# Get It Future Builder

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Pub package][pub_badge]][pub_link]

`get_it_future_builder` provides a widget named `GetItFutureBuilder` to wait for your async dependencies to be ready on your presentation layer.

## Installation 💻

**❗ In order to start using Get It Future Builder you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Add `get_it_future_builder` to your `pubspec.yaml`:

```yaml
dependencies:
  get_it_future_builder:
```

Install it:

```sh
flutter packages get
```

## How to Use It

### A Single Dependency

You can also see [example](example/) directory.

Register your async dependency through `GetIt` as such:

```dart
GetIt.I.registerSingletonAsync<Directory>(
  () async {
    return await getApplicationDocumentsDirectory();
  },
  instanceName: 'documents_dir', // optional
);
```

In our example, we'll use [getApplicationDocumentsDirectory](https://pub.dev/documentation/path_provider/latest/path_provider/getApplicationDocumentsDirectory.html) method of [path_provider](https://pub.dev/packages/path_provider). Since it calls native code through `MethodChannel`, it has to be asynchronous.

Then, in the presentation layer, you can simply do:

```dart
// notice how we get the dependency with generics
GetItFutureBuilder<Directory>(
  // optional
  instanceName: 'documentsDir',
  // render this widget while loading
  loading: (context) => LinearProgressIndicator(),
  // render this widget when it's ready
  ready: (context, instance) => Text('documents dir is: ${instance.path}'),
)
```

### Multiple Dependencies

`get_it_future_builder` supports the initialization widget up to 3 dependencies. These widgets are respectively named:

- `GetItFutureBuilder2`
- `GetItFutureBuilder3`

To initialize 2 dependencies on your widget tree, use `GetItFutureBuilder2`.

Let's assume we have two asynchronous dependencies.

```dart
GetIt.I.registerSingletonAsync<Directory>(
  () async {
    return await getApplicationDocumentsDirectory();
  },
  instanceName: 'documents_dir', // optional
);

GetIt.I.registerSingletonAsync<Directory>(
  () async {
    return await getTemporaryDirectory();
  },
  instanceName: 'temp_dir', // optional
);
```

To initialize them asynchronously, use `GetItFutureBuilder2` as below:

```dart
GetItFutureBuilder2<Directory, Directory>(
  instanceName1: 'documents_dir', // optional
  instanceName2: 'temp_dir', // optional
  loading: (context) => const LinearProgressIndicator(),
  ready: (context, instance1, instance2) => Text(
    'Documents dir is ${instance1.path} and temp dir is ${instance2.path}',
  ),
),
```

The initialization of dependencies run concurrently.

### Different Service Locator

By default, `GetItFutureBuilder` uses the global service locator `GetIt.I` (or `GetIt.instance`) to resolve dependencies. If you have initialized a different service locator, you can pass it to `GetItFutureBuilder` as below:

```dart
GetItFutureBuilder(
  // ...
  locator: myLocator,
  // ...
)
```

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[license_badge]: https://img.shields.io/badge/license-Apache%20License%202.0-blue.svg?style=flat-square
[license_link]: https://opensource.org/license/apache-2-0/
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg?style=flat-square
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[pub_badge]: https://img.shields.io/pub/v/get_it_future_builder?style=flat-square
[pub_link]: https://pub.dev/packages/get_it_future_builder
