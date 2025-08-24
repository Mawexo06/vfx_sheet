# Web Guidelines

This document describes the limitations and considerations for the web build of the On‑Set VFX Sheet.

## Web‑Safe Mode

- The web application runs entirely in the browser; it does not interface with hardware timecode devices or Bluetooth Low‑Energy equipment.
- Timecode must be entered manually via the Timecode panel.
- Witness camera feeds and overlay guides are limited to photo capture through the standard browser MediaDevices API.

## Browser Support

- The app is tested on modern Chromium‑based browsers (Chrome, Edge) and Safari.
- A secure context (HTTPS) is required for camera access.
- Offline caching and PWA installation work best on mobile Chrome and Safari.

## Permissions

- When adding references, the app will request camera access. Granting this permission is optional but required for taking photos.
- No other permissions are requested.

## Known Limitations

- Video capture, BLE pairing, serial/USB connections and hardware timecode generators are not supported on the web.
- Performance may vary on low‑power devices; heavy pages such as PDF exports may take longer to render.

Use the native mobile app (future scope) for advanced hardware integration. The web version prioritizes accessibility and data collection over hardware sync.
