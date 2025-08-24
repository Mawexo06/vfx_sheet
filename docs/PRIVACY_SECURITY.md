# Privacy and Security

This document outlines privacy and security considerations for the On‑Set VFX Sheet PWA.

## Data handling

- The application stores data locally in the browser using IndexedDB and does not send it to external servers.
- Users should avoid storing personally identifiable information (PII) or confidential production details in the app.
- Attachments and reference images are stored as blobs in the browser or as local file references; they are not uploaded to GitHub Pages or any backend.

## Exports

- Exported CSV, JSON and PDF files are generated entirely on the client device and downloaded using the browser’s download functionality.
- Exports should not include private identifiers such as crew names, phone numbers or email addresses.
- Any internal identifiers (primary keys, hashed IDs) should be excluded from public sharing.

## Permissions

- The web app only requests permission to use the camera when adding reference photos; camera access is only enabled over HTTPS.
- No other device sensors (e.g., Bluetooth, timecode hardware) are used in the web build.

## Offline storage

- Data persists offline via IndexedDB. Users should clear their browser storage if they need to remove sensitive data.
- The service worker caches only static assets; dynamic data is never cached via the network layer.

## Disclaimer

This tool is intended for on‑set metadata capture and should not be used to store sensitive personal information. Users are responsible for complying with their organization’s privacy policies.
