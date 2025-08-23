/// Web implementation for timecode related utilities.
///
/// Since there is no hardware timecode reader available in the web build,
/// this service focuses on formatting and parsing manual timecode inputs.
class TimecodeServiceWeb {
  /// Format total frame count into a timecode string (HH:MM:SS:FF).
  String format(int totalFrames, {int fps = 24}) {
    final seconds = totalFrames ~/ fps;
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;
    final frames = totalFrames % fps;
    return '${hours.toString().padLeft(2, '0')}'
        ':'
        '${minutes.toString().padLeft(2, '0')}'
        ':'
        '${secs.toString().padLeft(2, '0')}'
        ':'
        '${frames.toString().padLeft(2, '0')}';
  }

  /// Parse a timecode string (HH:MM:SS:FF) into total frames.
  int parse(String timecode, {int fps = 24}) {
    final parts = timecode.split(':');
    if (parts.length != 4) return 0;
    final hours = int.tryParse(parts[0]) ?? 0;
    final minutes = int.tryParse(parts[1]) ?? 0;
    final seconds = int.tryParse(parts[2]) ?? 0;
    final frames = int.tryParse(parts[3]) ?? 0;
    return ((hours * 3600 + minutes * 60 + seconds) * fps) + frames;
  }
}
