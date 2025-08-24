# UX Guide

This document provides guidelines for the user experience of the On‑Set VFX Sheet PWA. The app is designed for busy VFX supervisors, DITs and data wranglers working on set, so it must be simple, accessible and performant.

## Colors

- **Theme:** Material 3 dark theme by default with a high‑contrast palette.
- **Primary color:** Use the default Material primary color for emphasis. Secondary actions may use a neutral surface color.
- **Background:** Use dark surfaces with enough contrast against cards and controls.
- **Feedback colors:** Use green for success, orange for warnings and red for errors.

## Typography

- **Font family:** Use Inter or Roboto Flex, which are accessible and support multiple weights.
- **Font sizes:** Base font size at least 16 px. Titles should be larger (20–24 px), section headings (18 px) and body text (16 px).
- **Localization:** The app must support English and Slovak; design must accommodate longer translated strings.

## Layout and Spacing

- **Responsive:** Use flexible layouts that adapt to various screen sizes. The app will be used on tablets and laptops.
- **Hit targets:** Buttons and toggles must be at least 48 × 48 px to ensure they are easy to tap.
- **Padding:** Apply consistent spacing between sections (8–16 px) and around content.

## Buttons and Controls

- **Primary buttons:** Elevated or filled buttons for the main action of a screen.
- **Secondary buttons:** Outlined buttons or text buttons for less important actions.
- **State feedback:** Provide visual feedback (pressed, disabled) and descriptive labels. Avoid ambiguous icons alone.

## States and Accessibility

- **Offline/online status:** Display a banner or icon indicating whether the app is offline, online or syncing.
- **Loading states:** Show progress indicators when fetching or saving data.
- **Keyboard navigation:** Ensure that all interactive controls can be accessed via keyboard. Provide focus outlines.
- **WCAG compliance:** Aim for level AA compliance by ensuring sufficient contrast and providing accessible names for controls.
