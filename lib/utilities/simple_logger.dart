// Copyright (c) 2024 carljdp.com
// This source code is provided for non-commercial use only.
// Unauthorized commercial use is prohibited.

// Repo: carljdp/cargo_cult
// File: lib/utilities/simple_logger.dart

library cargo_cult;

import 'dart:developer' as dart_developer show log;

enum LoggerMode {
  inline,
  bypass,
}

class SimpleLogger<T extends Object> {
  //
  String _name;
  LoggerMode _mode;

  // Private unnamed (default) generative constructor
  SimpleLogger._({required String name, required LoggerMode mode})
      : _name = name,
        _mode = mode;

  // Public unnamed (default) generative constructor
  factory SimpleLogger({String? name, LoggerMode? mode}) {
    return SimpleLogger._(
      name: name ?? T.toString(),
      mode: mode ?? LoggerMode.inline,
    );
  }

  void log({
    String message = '',
    int? sequenceNumber,
    int level = 0,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (_mode == LoggerMode.bypass) return;

    dart_developer.log(
      message,
      time: DateTime.now(),
      sequenceNumber: sequenceNumber,
      level: level,
      name: _name,
      error: error,
      stackTrace: stackTrace,
    );
  }

  //
}
