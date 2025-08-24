/// Feature flags used to enable or disable parts of the application.
///
/// On the web, some hardware-dependent features are disabled for safety.
class FeatureFlags {
  /// Enable or disable the VP LED panel feature.
  static const bool vpLedEnabled = false;

  /// Enable or disable witness camera support.
  static const bool witnessEnabled = true;

  /// Whether this build is targeting the web.
  /// This can be passed via --dart-define=WEB_BUILD=true at build time.
  static const bool isWebBuild = bool.fromEnvironment('WEB_BUILD', defaultValue: false);
}
