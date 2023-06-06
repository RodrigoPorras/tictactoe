import 'dart:collection';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/src/config/audio/songs.dart';
import 'package:tictactoe/src/config/audio/sounds.dart';
import 'package:tictactoe/src/utils/lifecycle_observer.dart';

class AudioController {
  final AudioPlayer _musicPlayer;

  final List<AudioPlayer> _sfxPlayers;

  final Queue<Song> _playlist;

  int _currentSfxPlayer = 0;

  WidgetsBindingObserver? widgetsBindingObserver;

  AudioController()
      : _musicPlayer = AudioPlayer(),
        _playlist = Queue.of(List<Song>.of(songs)..shuffle()),
        _sfxPlayers = [AudioPlayer(), AudioPlayer()] {
    _musicPlayer.onPlayerComplete.listen(_changeSong);
    widgetsBindingObserver = LifecycleObserver(
      onPaused: () {
        playSfx(SfxType.squareTap);
        _pauseMusic();
      },
      onResume: _resumeMusic,
    );
  }

  void playSfx(SfxType type) {
    final filename = soundTypeToFilename(type);

    final currentPlayer = _sfxPlayers[_currentSfxPlayer];
    currentPlayer.play(AssetSource('sfx/$filename'));
    _currentSfxPlayer = (_currentSfxPlayer + 1) % _sfxPlayers.length;
  }

  void initialize() {
    listenAppLifecycleChanges();
    _startMusic();
  }

  void listenAppLifecycleChanges() {
    if (widgetsBindingObserver != null) {
      WidgetsBinding.instance.addObserver(
        widgetsBindingObserver!,
      );
    }
  }

  void _startMusic() {
    _playFirstSongInPlaylist();
  }

  void _pauseMusic() {
    if (_musicPlayer.state == PlayerState.playing) {
      _musicPlayer.pause();
    }
  }

  Future<void> _resumeMusic() async {
    try {
      await _musicPlayer.resume();
    } catch (e) {
      await _playFirstSongInPlaylist();
    }
  }

  Future<void> _playFirstSongInPlaylist() async {
    await _musicPlayer.play(
      AssetSource('music/${_playlist.first.filename}'),
      volume: 0.7,
    );
  }

  void _changeSong(void _) {
    _playlist.addLast(_playlist.removeFirst());
    _playFirstSongInPlaylist();
  }

  void dispose() {
    _musicPlayer.dispose();
    for (final player in _sfxPlayers) {
      player.dispose();
    }
    if (widgetsBindingObserver != null) {
      WidgetsBinding.instance.removeObserver(
        widgetsBindingObserver!,
      );
    }
  }
}
