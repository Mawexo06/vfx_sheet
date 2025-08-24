# Export Specifications

This document defines the export formats provided by the On‑Set VFX Sheet. Users can download data as PDF, CSV or JSON from the Exports screen.

## CSV and JSON

The flat CSV and JSON exports join takes with their parent shots, slates, days and projects. Each row represents a single take with the following columns:

- `project_code`, `project_title`
- `day_date`, `day_location`, `day_weather`, `day_master_tc_source`
- `slate_code`
- `shot_code`, `vfx_flag`
- `take_number`
- `fps`, `shutter`, `iso`, `wb`, `codec`, `bit_depth`, `resolution`, `lut`, `cdl`
- `roll_id`, `clip_id`
- `nd_filter`, `polarizer`, `t_stop`, `focal_length_mm`, `focus_distance_m`
- `i_lds_xd_meta_json`
- `tc_in`, `tc_out`, `tc_source`, `tc_jam_note`
- `done_hdr`, `done_grey`, `done_chrome`, `done_colorchecker`, `done_grid`, `done_cleanplate`, `done_witness`
- `geo_camera_height_cm`, `geo_subject_distance_cm`, `pan_deg`, `tilt_deg`, `rig`, `markers`
- `camera_make`, `camera_model`, `lens_make`, `lens_model`
- `references_count` – number of reference photos attached
- `created_at`, `updated_at`

All boolean flags are exported as `true` or `false`. JSON exports mirror the CSV but use nested objects for clarity.

## PDF One Sheet per Shot

The PDF export generates a separate page for each shot with the following sections:

- **Header** – Project code, day date, slate code, shot code and take count.
- **VFX Checklist** – Checkboxes showing which checklist items were completed for the takes.
- **Metadata Table** – A table listing settings that are common across takes (FPS, shutter, ISO, lens etc.).
- **Thumbnails** – A row of thumbnails of reference photos and witness camera images.
- **Notes** – Combined notes from shots and takes.

Thumbnails link back to the original images when viewed in a PDF reader.

## Encoding and localization

- CSV files are encoded in UTF‑8 with a comma delimiter.
- Decimal numbers use a dot (`.`) as the decimal separator.
- Dates use ISO‑8601 format (e.g., `2025-08-24`).
- The export includes both English and Slovak labels depending on the selected language of the app.
