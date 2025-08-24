# Data Model

This document describes the tables and columns used by the On‑Set VFX Sheet. The application uses Drift (IndexedDB) on the web, and each table has an auto‑incrementing primary key `id`.

## projects

- `id` – primary key
- `code` – short project code, e.g. "PRJ01"
- `title` – project name
- `unit` – production unit or stage
- `timezone` – time zone string (e.g., "Europe/Bratislava")
- `created_at`, `updated_at` – timestamps

## shooting_days

- `id` – primary key
- `project_id` – foreign key to `projects.id`
- `date` – date of the shooting day (YYYY‑MM‑DD)
- `location` – free text location name
- `weather` – optional weather description
- `master_tc_source` – default timecode source for the day
- `notes` – general notes
- plus timestamps

## slates

- `id`
- `day_id` – foreign key to `shooting_days.id`
- `slate_code` – code printed on the slate/clapperboard
- `description` – optional description

## shots

- `id`
- `slate_id` – foreign key to `slates.id`
- `shot_code` – shot identifier (e.g., "A001")
- `vfx_flag` – boolean indicating VFX involvement
- `camera_profile_id`, `lens_profile_id` – references to profiles
- geometry: `geo_camera_height_cm`, `geo_subject_distance_cm`, `pan_deg`, `tilt_deg`, `rig` (free text), `markers` (free text)
- `notes` – optional comments
- plus timestamps

## takes

- `id`
- `shot_id` – foreign key to `shots.id`
- `take_number` – integer
- camera settings: `fps`, `shutter`, `iso`, `wb` (white balance), `codec`, `bit_depth`, `resolution`, `lut`, `cdl`
- clip: `roll_id`, `clip_id`
- filters and optics: `nd_filter`, `polarizer`, `t_stop`, `focal_length_mm`, `focus_distance_m`
- `i_lds_xd_meta_json` – JSON metadata from /i, LDS or XD lens systems
- timecode: `tc_in`, `tc_out`, `tc_source`, `tc_jam_note`
- done flags: `done_hdr`, `done_grey`, `done_chrome`, `done_colorchecker`, `done_grid`, `done_cleanplate`, `done_witness` – booleans indicating whether each checklist item is completed
- `created_at`, `updated_at`

## references

- `id`
- `take_id` – foreign key to `takes.id`
- `type` – enumerated: `'photo'`, `'hdri'`, `'grid'`, `'doc'`
- `path_or_blobref` – path or blob reference to the stored file
- `thumb_url` – optional thumbnail URL
- `exif_json` – JSON with EXIF data
- `bracket_info_json` – JSON describing exposure brackets

## witness_cams

- `id`
- `shot_id` – foreign key to `shots.id`
- `label` – label A–D
- `fps` – frames per second
- `resolution`
- `lens`
- `position_note` – free text description of camera placement
- `synced_bool` – whether timecode is synced
- `tc_source`
- `photo_url` – optional photograph of the witness camera rig

## vp_led

Used for virtual production LED wall metadata (feature‑flagged off by default).

- `id`
- `shot_id`
- `stage_id`
- `vendor`
- `pixel_pitch_mm`
- `refresh_hz`
- `scan_mode`
- `genlock`
- `ue_version`, `ndisplay_version`
- `frustum_id`, `content_build_id`
- `tracking_system`
- `whitepoint_x`, `whitepoint_y`
- `nits` – brightness
- `notes`

## camera_profiles

- `id`
- `make` – manufacturer
- `model`
- `sensor` – sensor size/format
- `default_resolution`
- `default_codec`
- `notes`

## lens_profiles

- `id`
- `make`, `model`, `serial`
- `supports_i_bool`, `supports_lds_bool`, `supports_xd_bool` – booleans indicating support for /i, LDS and XD metadata
- `notes`

## attachments

- `id`
- `entity_type` – the table that owns the attachment (e.g., `project`, `shot`)
- `entity_id` – id of the record
- `url` – location of the file (e.g., S3 or local)
- `mime` – MIME type of the file
- `size` – file size in bytes
- `hash` – checksum
- `created_at` – timestamp
