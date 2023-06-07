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

/// {@template get_it_dependency}
/// Describes a `get_it` dependency.
/// {@endtemplate}
class GetItDependency {
  /// {@macro get_it_dependency}
  GetItDependency({
    required this.type,
    this.instanceName,
  });

  /// The type of dependency.
  final Type type;

  /// The name of dependency defined in `instanceName` when you register it
  /// to `get_it`.
  final String? instanceName;
}
