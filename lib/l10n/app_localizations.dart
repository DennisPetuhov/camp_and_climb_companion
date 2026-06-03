import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Application title shown in the task switcher and MaterialApp
  ///
  /// In en, this message translates to:
  /// **'Camp & Climb Companion'**
  String get appTitle;

  /// Title for the Overpass debug page
  ///
  /// In en, this message translates to:
  /// **'Overpass JSON size'**
  String get overpassPageTitle;

  /// Label for the read-only JSON size field
  ///
  /// In en, this message translates to:
  /// **'JSON character count'**
  String get overpassJsonCountLabel;

  /// Button to trigger an Overpass API request
  ///
  /// In en, this message translates to:
  /// **'Load from Overpass'**
  String get overpassLoadButton;

  /// Line showing how many characters are in the JSON response
  ///
  /// In en, this message translates to:
  /// **'{count} symbols'**
  String overpassResultSymbols(int count);

  /// Line showing how many drinking water elements were returned
  ///
  /// In en, this message translates to:
  /// **'{count} fountains'**
  String overpassResultFountains(int count);

  /// Title for the OpenBeta debug page
  ///
  /// In en, this message translates to:
  /// **'OpenBeta JSON size'**
  String get openBetaPageTitle;

  /// Label for the read-only JSON size field on OpenBeta page
  ///
  /// In en, this message translates to:
  /// **'JSON character count'**
  String get openBetaJsonCountLabel;

  /// Button to trigger an OpenBeta GraphQL request
  ///
  /// In en, this message translates to:
  /// **'Load from OpenBeta'**
  String get openBetaLoadButton;

  /// Line showing how many characters are in the OpenBeta JSON response
  ///
  /// In en, this message translates to:
  /// **'{count} symbols'**
  String openBetaResultSymbols(int count);

  /// Line showing how many climbing areas were returned
  ///
  /// In en, this message translates to:
  /// **'{count} areas'**
  String openBetaResultAreas(int count);

  /// Title for the template feature debug home screen
  ///
  /// In en, this message translates to:
  /// **'API debug'**
  String get templateDebugHomeTitle;

  /// Navigation tile to the Overpass debug page
  ///
  /// In en, this message translates to:
  /// **'Overpass'**
  String get templateDebugOverpassTile;

  /// Navigation tile to the OpenBeta debug page
  ///
  /// In en, this message translates to:
  /// **'OpenBeta'**
  String get templateDebugOpenBetaTile;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
