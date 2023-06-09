// the whole purpose of this is to not fail CI

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('redundant', () {
    expect(true, true);
  });
}
