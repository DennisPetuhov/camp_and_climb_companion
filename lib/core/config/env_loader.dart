import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Loads environment variables from bundled assets.
///
/// Copy [.env.example] to `.env` for local overrides, add `.env` to
/// [pubspec.yaml] assets, and load it here before `.env.example`.
Future<void> loadEnv() async {
  try {
    await dotenv.load(fileName: '.env');
    return;
  } on Object {
    await dotenv.load(fileName: '.env.example');
  }
}