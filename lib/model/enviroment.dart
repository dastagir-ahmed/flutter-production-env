import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    if (kReleaseMode) {
      return '.env.production';
    }

    return '.env.development';
  }

  static String get apiKey {
    return dotenv.env['GOOGLE_MAP_KEYS'] ?? "GOOGLE_MAP_KEYS not specified";
  }

   static String get apiBaseUrl {
    return dotenv.env['APP_URL'] ?? "APP_URL not specified";
  }
}

