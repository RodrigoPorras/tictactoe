// Mocks generated by Mockito 5.4.1 from annotations
// in tictactoe/test/mocks/mocks.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i7;

import 'package:flutter/material.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tictactoe/src/config/audio/audio_controller.dart' as _i2;
import 'package:tictactoe/src/config/audio/sounds.dart' as _i4;
import 'package:tictactoe/src/modules/play_session/controllers/game_controller.dart'
    as _i5;
import 'package:tictactoe/src/modules/play_session/models/enums.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [AudioController].
///
/// See the documentation for Mockito's code generation for more information.
class MockAudioController extends _i1.Mock implements _i2.AudioController {
  MockAudioController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set widgetsBindingObserver(
          _i3.WidgetsBindingObserver? _widgetsBindingObserver) =>
      super.noSuchMethod(
        Invocation.setter(
          #widgetsBindingObserver,
          _widgetsBindingObserver,
        ),
        returnValueForMissingStub: null,
      );
  @override
  void playSfx(_i4.SfxType? type) => super.noSuchMethod(
        Invocation.method(
          #playSfx,
          [type],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void initialize() => super.noSuchMethod(
        Invocation.method(
          #initialize,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void listenAppLifecycleChanges() => super.noSuchMethod(
        Invocation.method(
          #listenAppLifecycleChanges,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [GameController].
///
/// See the documentation for Mockito's code generation for more information.
class MockGameController extends _i1.Mock implements _i5.GameController {
  MockGameController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<List<String>> get board => (super.noSuchMethod(
        Invocation.getter(#board),
        returnValue: <List<String>>[],
      ) as List<List<String>>);
  @override
  set board(List<List<String>>? _board) => super.noSuchMethod(
        Invocation.setter(
          #board,
          _board,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Turn get playerTurn => (super.noSuchMethod(
        Invocation.getter(#playerTurn),
        returnValue: _i6.Turn.player1,
      ) as _i6.Turn);
  @override
  set playerTurn(_i6.Turn? _playerTurn) => super.noSuchMethod(
        Invocation.setter(
          #playerTurn,
          _playerTurn,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.GameState get gameState => (super.noSuchMethod(
        Invocation.getter(#gameState),
        returnValue: _i6.GameState.idle,
      ) as _i6.GameState);
  @override
  set gameState(_i6.GameState? _gameState) => super.noSuchMethod(
        Invocation.setter(
          #gameState,
          _gameState,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  dynamic squareWasPressed(
    int? x,
    int? y,
  ) =>
      super.noSuchMethod(Invocation.method(
        #squareWasPressed,
        [
          x,
          y,
        ],
      ));
  @override
  bool checkWin() => (super.noSuchMethod(
        Invocation.method(
          #checkWin,
          [],
        ),
        returnValue: false,
      ) as bool);
  @override
  void addListener(_i7.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i7.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
