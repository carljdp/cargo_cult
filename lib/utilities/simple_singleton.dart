// Copyright (c) 2024 carljdp.com
// This source code is provided for non-commercial use only.
// Unauthorized commercial use is prohibited.

// Repo: carljdp/cargo_cult
// File: lib/utilities/simple_singleton.dart

library cargo_cult;

import 'package:cargo_cult/utilities/simple_logger.dart';

class SimpleSingleton<SubClass extends Object> extends Object {
  //
  // ==< STATIC >=============================================================

  // ---------------< FIELDS >-----------------

  // This class' own singleton instance
  static SimpleSingleton? _instance;

  static SimpleLogger? _logger;

  // ------------< CONSTRUCTORS >--------------

  // Protected generative constructor for subclassing
  SimpleSingleton.createNewForSubclass({bool enableDebug = false}) : super() {
    if (runtimeType == SimpleSingleton || runtimeType != SubClass) {
      throw Exception('The SimpleSingleton.protected() constructor '
          'may only be called from a subclass.');
    }
    // saving ref to `this` out onto the class' own static `_instance`
    SimpleSingleton._instance = this;
    SimpleSingleton._logger =
        SimpleLogger<SimpleSingleton>(mode: enableDebug ? LoggerMode.inline : LoggerMode.bypass);
    log(message: 'Created new $this');
  }

  // Private generative constructor
  SimpleSingleton._createNew({bool enableDebug = false}) {
    // saving ref to `this` out onto the class' own static `_instance`
    SimpleSingleton._instance = this;
    SimpleSingleton._logger =
        SimpleLogger<SimpleSingleton>(mode: enableDebug ? LoggerMode.inline : LoggerMode.bypass);
    log(message: 'Created new $this');
  }

  // Private factory
  factory SimpleSingleton._getExistingOrCreateNew({bool enableDebug = false}) {
    return (SimpleSingleton._instance != null)
        ? SimpleSingleton._instance! as SimpleSingleton<SubClass>
        : SimpleSingleton<SubClass>._createNew(enableDebug: enableDebug);
  }

  // Public redirecting constructor
  factory SimpleSingleton({
    bool enableDebug,
  }) = SimpleSingleton._getExistingOrCreateNew;

  // --------------< ACCESSORS >---------------

  static SimpleSingleton get instance => SimpleSingleton._getExistingOrCreateNew();

  static SimpleLogger get logger => _logger ?? SimpleLogger(mode: LoggerMode.bypass);

  // ==< INSTANCE >=============================================================

  // ---------------< FIELDS >-----------------

  final DateTime _timestamp = DateTime.timestamp();

  // --------------< ACCESSORS >---------------

  void Function({
    String message,
    int? sequenceNumber,
    int level,
    Object? error,
    StackTrace? stackTrace,
  }) get log => SimpleSingleton.logger.log;

  // ----------< BUILTIN OVERRIDES >-----------

  @override
  String toString() {
    return '$runtimeType#$hashCode';
  }

  @override
  int get hashCode {
    // not perfect, but good enough
    return _timestamp.microsecondsSinceEpoch;
  }

  @override
  bool operator ==(Object other) {
    return hashCode == other.hashCode;
  }

  //
}
