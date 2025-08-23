import 'dart:html';

/// Service for simple key-value storage on the web.
/// Uses the browser's localStorage for persisting small data.
class StorageServiceWeb {
  /// Saves a string [value] under the given [key].
  void setString(String key, String value) {
    window.localStorage[key] = value;
  }

  /// Retrieves the string value for the given [key], or null if absent.
  String? getString(String key) {
    return window.localStorage[key];
  }

  /// Removes the value associated with [key].
  void remove(String key) {
    window.localStorage.remove(key);
  }
}
