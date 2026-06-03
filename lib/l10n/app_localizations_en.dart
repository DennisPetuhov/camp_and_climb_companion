// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Camp & Climb Companion';

  @override
  String get overpassPageTitle => 'Overpass JSON size';

  @override
  String get overpassJsonCountLabel => 'JSON character count';

  @override
  String get overpassLoadButton => 'Load from Overpass';

  @override
  String overpassResultSymbols(int count) {
    return '$count symbols';
  }

  @override
  String overpassResultFountains(int count) {
    return '$count fountains';
  }

  @override
  String get openBetaPageTitle => 'OpenBeta JSON size';

  @override
  String get openBetaJsonCountLabel => 'JSON character count';

  @override
  String get openBetaLoadButton => 'Load from OpenBeta';

  @override
  String openBetaResultSymbols(int count) {
    return '$count symbols';
  }

  @override
  String openBetaResultAreas(int count) {
    return '$count areas';
  }

  @override
  String get templateDebugHomeTitle => 'API debug';

  @override
  String get templateDebugOverpassTile => 'Overpass';

  @override
  String get templateDebugOpenBetaTile => 'OpenBeta';
}
