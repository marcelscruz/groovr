import 'package:flutter/foundation.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:groovr/models/configuration.dart';

class Player extends ChangeNotifier {
  AudioPlayer _player;
  AudioPlayerState _playerState;
  AudioCache _audioCache;
  Duration _duration = Duration();
  Duration _position = Duration();
  Configuration configuration;

  Player() {
    _player = AudioPlayer();
    _audioCache = AudioCache(fixedPlayer: _player);

    _player.onDurationChanged.listen((Duration d) {
      _duration = d;
    });

    _player.onAudioPositionChanged.listen((Duration p) {
      _position = p;
    });

    _player.onPlayerStateChanged.listen((AudioPlayerState s) {
      _playerState = s;
    });
    notifyListeners();
  }

  AudioPlayer get playerController {
    return _player;
  }

  AudioPlayerState get playerState {
    return _playerState;
  }

  AudioCache get audioCache {
    return _audioCache;
  }

  Duration get duration {
    return _duration;
  }

  Duration get position {
    return _position;
  }

  void slideToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    _player.seek(newDuration);
    notifyListeners();
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    _player.seek(_position + newDuration);
    notifyListeners();
  }
}
