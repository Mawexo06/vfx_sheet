# Deployment Guide

This document describes how the On‑Set VFX Sheet is built and deployed to GitHub Pages.

## GitHub Actions Workflow

The project uses a workflow located at `.github/workflows/deploy.yml`. The workflow performs the following steps when code is pushed to the `main` branch:

1. **Checkout** – Clone the repository.
2. **Install Flutter** – Use `subosito/flutter-action@v2` with the `stable` channel to install Flutter.
3. **Install dependencies** – Run `flutter pub get`.
4. **Analyze and test** – Run `flutter analyze` and `flutter test`.
5. **Determine base href** – Use a shell step to set the `BASE_HREF` variable:
   - If the repository name ends with `.github.io`, `BASE_HREF` is `/`.
   - Otherwise it is `/<repo-name>/`.
6. **Build** – Execute `flutter build web --release --base-href $BASE_HREF --dart-define=WEB_BUILD=true`.
7. **Copy index** – Copy `build/web/index.html` to `build/web/404.html` to provide a SPA fallback for Pages.
8. **Deploy** – Use `peaceiris/actions-gh-pages@v3` to publish the `build/web` directory to the `gh-pages` branch.

The workflow uses the automatically provided `GITHUB_TOKEN` for authentication; no additional secrets are required.

## Local Development

While this repository uses a GitHub‑only workflow, you can test locally by running:

```bash
flutter pub get
flutter build web --release --base-href /
```

Serve the `build/web` directory using any static file server.

## Troubleshooting

- Ensure that all files are committed before pushing; missing files can cause the build to fail.
- If the site loads without styling, check that the base href is set correctly.
- The `gh-pages` branch must have Pages enabled in repository settings.

After the workflow completes, the application will be available at `https://<username>.github.io/<repo>/` (or at the root domain if using a `.github.io` repository).
