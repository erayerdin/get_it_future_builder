// Copyright 2023 Eray Erdin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

/// {@template get_it_future_builder}
/// A builder widget for async dependencies registered to `get_it`.
/// {@endtemplate}
// ignore: must_be_immutable
class GetItFutureBuilder<T extends Object> extends StatelessWidget {
  /// {@macro get_it_future_builder}
  GetItFutureBuilder({
    required Widget Function(BuildContext context) loading,
    required Widget Function(BuildContext context, T instance) ready,
    super.key,
    String? instanceName,
  }) {
    _instanceName = instanceName;
    _loading = loading;
    _ready = ready;
  }

  late String? _instanceName;
  late Widget Function(BuildContext context) _loading;
  late Widget Function(BuildContext context, T instance) _ready;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ignore: only_throw_errors
          throw snapshot.error!;
        }

        if (snapshot.hasData) {
          return _ready(context, snapshot.data!);
        } else {
          return _loading(context);
        }
      },
      future: () async {
        final dependency =
            await GetIt.I.getAsync<T>(instanceName: _instanceName);
        return dependency;
      }(),
    );
  }
}
