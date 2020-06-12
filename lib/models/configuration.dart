import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:groovr/utils/constants.dart';

class Configuration extends ChangeNotifier {
  String normalizeCurrentTrack(String string) {
    return string.replaceAll(' ', '').toLowerCase();
  }

  // Current track
  String get currentTrack {
    return normalizeCurrentTrack('$_selectedGenre-$_selectedKey-major.mp3');
  }

  // KEY
  List<String> _keys = [
    kA,
    kASharp,
    kB,
    kC,
    kCSharp,
    kD,
    kDSharp,
    kE,
    kF,
    kFSharp,
    kG,
    kGSharp,
  ];

  UnmodifiableListView<String> get keys {
    return UnmodifiableListView(_keys);
  }

  String _selectedKey = kA;

  String get selectedKey {
    return _selectedKey;
  }

  void updateSelectedKey(key) {
    _selectedKey = key;
    notifyListeners();
  }

  // GENRE
  List<String> _genres = [
    kBlues,
    kBossaNova,
    kJazz,
    kRock,
  ];

  UnmodifiableListView<String> get genres {
    return UnmodifiableListView(_genres);
  }

  String _selectedGenre = kBlues;

  String get selectedGenre {
    return _selectedGenre;
  }

  void updateSelectedGenre(genre) {
    _selectedGenre = genre;
    notifyListeners();
  }

  // SCALE
  List<String> _scales = [
    kMajorPentatonic,
    kMinorPentatonic,
  ];

  UnmodifiableListView<String> get scales {
    return UnmodifiableListView(_scales);
  }

  String _selectedScale = kMajorPentatonic;

  String get selectedScale {
    return _selectedScale;
  }

  void updateSelectedScale(scale) {
    _selectedScale = scale;
    notifyListeners();
  }
}
