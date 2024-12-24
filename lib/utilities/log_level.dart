// Copyright (c) 2024 carljdp.com
// This source code is provided for non-commercial use only.
// Unauthorized commercial use is prohibited.

// Repo: carljdp/cargo_cult
// File: lib/utilities/log_level.dart

library cargo_cult;

// ignore_for_file: constant_identifier_names

/// Integer log levels roughly aligning with that used by `dart:developer`,
/// which uses `package:logger` internally.
class LogLevel {
  //

  // For more info on the origin of magic numbers used below, see:
  // https://github.com/dart-lang/core/blob/main/pkgs/logging/lib/src/level.dart

  static const int DBG = 600;
  static const int INF = 800;
  static const int WRN = 900;
  static const int ERR = 1000;

  //
}
