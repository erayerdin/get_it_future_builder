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

import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

void initLocator() {
  GetIt.I.registerFactoryAsync<Directory>(
    () async {
      await Future.delayed(const Duration(seconds: 5)); // a fake wait
      return await getApplicationDocumentsDirectory();
    },
    instanceName: 'documents_dir',
  );
}
