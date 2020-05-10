import 'package:flutter/foundation.dart';
import 'dart:collection';

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
    'A',
    'A#',
    'B',
    'C',
    'C#',
    'D',
    'D#',
    'E',
    'F',
    'F#',
    'G',
    'G#',
  ];

  UnmodifiableListView<String> get keys {
    return UnmodifiableListView(_keys);
  }

  String _selectedKey = 'A';

  String get selectedKey {
    return _selectedKey;
  }

  void updateSelectedKey(key) {
    _selectedKey = key;
    notifyListeners();
  }

  // GENRE
  List<String> _genres = [
    'Blues',
    'Bossa Nova',
    'Jazz',
    'Rock',
  ];

  UnmodifiableListView<String> get genres {
    return UnmodifiableListView(_genres);
  }

  String _selectedGenre = 'Blues';

  String get selectedGenre {
    return _selectedGenre;
  }

  void updateSelectedGenre(genre) {
    _selectedGenre = genre;
    notifyListeners();
  }

  // SCALE
  List<String> _scales = [
    'Major',
    'Minor',
  ];

  UnmodifiableListView<String> get scales {
    return UnmodifiableListView(_scales);
  }

  String _selectedScale = 'Major';

  String get selectedScale {
    return _selectedScale;
  }

  void updateSelectedScale(scale) {
    _selectedScale = scale;
    notifyListeners();
  }
}
