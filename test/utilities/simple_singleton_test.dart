// Copyright (c) 2024 carljdp.com
// This source code is provided for non-commercial use only.
// Unauthorized commercial use is prohibited.

// Repo: carljdp/cargo_cult
// File: test/simple_singleton_test.dart

import 'package:cargo_cult/utilities/simple_singleton.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('can be instantiated', () {
    final ss = SimpleSingleton(enableDebug: true);
    expect(ss.runtimeType, SimpleSingleton);
  });

  test('always returns the same original cached instance', () {
    final ss1 = SimpleSingleton(enableDebug: true);
    final ss2 = SimpleSingleton(enableDebug: true);
    expect(ss1, ss2);
    expect(SimpleSingleton.instance, ss1);
    expect(SimpleSingleton.instance, ss2);
  });
}
