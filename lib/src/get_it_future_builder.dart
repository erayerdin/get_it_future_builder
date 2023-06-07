import 'package:flutter/widgets.dart';
import 'package:get_it_future_builder/src/dependency.dart';

/// {@template get_it_future_builder}
/// A builder widget for async dependencies registered to `get_it`.
/// {@endtemplate}
// ignore: must_be_immutable
class GetItFutureBuilder<T> extends StatelessWidget {
  /// {@macro get_it_future_builder}
  GetItFutureBuilder({
    required GetItDependency dependency,
    required Widget Function(BuildContext context) loading,
    required Widget Function(BuildContext context, T instance) ready,
    super.key,
  }) {
    _dependency = dependency;
    _loading = loading;
    _ready = ready;
  }

  late GetItDependency _dependency;
  late Widget Function(BuildContext context) _loading;
  late Widget Function(BuildContext context, T instance) _ready;

  @override
  Widget build(BuildContext context) {
    return const Text('hello');
  }
}
