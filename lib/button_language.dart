const String _pathPrefix = 'packages/add_to_google_wallet/assets/svg/buttons/';
const String _pathSuffix = '_add_to_google_wallet.svg';

enum ButtonLanguage {
  /// Bulgarian
  bg,

  /// Czech
  cz,

  /// German
  de,

  /// Danish
  dk,

  /// English
  en,

  /// Spanish
  es,

  /// French
  fr,

  /// Greek
  gr,

  /// Croatian
  hr,

  /// Hungarian
  hu,

  /// Italian
  it,

  /// Japanese
  jp,

  /// Lithuanian
  lt,

  /// Latvian
  lv,

  /// Dutch
  nl,

  /// Norwegian
  no,

  /// Polish
  pl,

  /// Portuguese
  pt,

  /// Romanian
  ro,

  /// Russian
  ru,

  /// Slovak
  sk,

  /// Slovenian
  sl,

  /// Turkish
  tr,

  /// Ukrainian
  uk;

  String get path => '$_pathPrefix$name$_pathSuffix';
}
