import 'dart:html';
import 'dart:async';
import 'dart:typed_data';

/// Service for capturing images on the web.
/// Uses the browser file input to allow taking a picture or selecting
/// an existing image from the file system.
class CameraCaptureServiceWeb {
  /// Opens a file picker and returns the selected image as bytes.
  /// Returns null if the user cancels the selection.
  Future<Uint8List?> captureImage() async {
    final completer = Completer<Uint8List?>();
    final InputElement uploadInput = FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();
    uploadInput.onChange.listen((_) {
      final file = uploadInput.files?.first;
      if (file != null) {
        final reader = FileReader();
        reader.readAsArrayBuffer(file);
        reader.onLoadEnd.listen((_) {
          completer.complete(reader.result as Uint8List?);
        });
      } else {
        completer.complete(null);
      }
    });
    return completer.future;
  }
}
