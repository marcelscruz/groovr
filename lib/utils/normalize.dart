import 'package:groovr/utils/constants.dart';

class Normalize {
  static String keyToAsset(String value) {
    switch (value) {
      // case kMajorPentatonic:
      //   return 'pentatonic-major';
      //   break;
      default:
        return '';
    }
  }

  static String genreToAsset(String value) {
    switch (value) {
      // case kMajorPentatonic:
      //   return 'pentatonic-major';
      //   break;
      default:
        return '';
    }
  }

  static String scaleToAsset(String value) {
    switch (value) {
      case kMajorPentatonic:
        return 'pentatonic-major';
        break;
      case kMinorPentatonic:
        return 'pentatonic-minor';
        break;
      default:
        return '';
    }
  }
}
