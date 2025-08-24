import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import '../../core/data/database.dart';

class DayDashboardPage extends StatefulWidget {
  const DayDashboardPage({super.key});

  @override
  State<DayDashboardPage> createState() => _DayDashboardPageState();
}

class _DayDashboardPageState extends State<DayDashboardPage> {
  late final AppDatabase _db;
  bool _loading = false;
  int _slateCount = 0;
  int _shotCount = 0;
  int _takeCount = 0;

  @override
  void initState() {
    super.initState();
    _db = AppDatabase();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  Future<void> _loadDemoData() async {
    setState(() => _loading = true);
    final now = DateTime.now();
    // Clear existing data
    await _db.delete(_db.takes).go();
    await _db.delete(_db.shots).go();
    await _db.delete(_db.slates).go();
    await _db.delete(_db.shootingDays).go();
    await _db.delete(_db.projects).go();

    // Insert project and day
    final projectId = await _db.into(_db.projects).insert(
      ProjectsCompanion.insert(
        code: 'SHOW-X',
        title: 'SHOW-X',
        createdAt: now,
        updatedAt: Value(now),
      ),
    );
    final today = DateTime(now.year, now.month, now.day);
    final dayId = await _db.into(_db.shootingDays).insert(
      ShootingDaysCompanion.insert(
        projectId: projectId,
        date: today,
      ),
    );
    // Create slates, shots and takes
    for (var s = 1; s <= 2; s++) {
      final slateCode = 'S$s';
      final slateId = await _db.into(_db.slates).insert(
        SlatesCompanion.insert(
          dayId: dayId,
          slateCode: slateCode,
          description: Value('Demo slate $s'),
        ),
      );
      for (var sh = 1; sh <= 3; sh++) {
        final shotCode = 'S${s}SH$sh';
        final shotId = await _db.into(_db.shots).insert(
          ShotsCompanion.insert(
            slateId: slateId,
            shotCode: shotCode,
            createdAt: now,
          ),
        );
        for (var t = 1; t <= 2; t++) {
          await _db.into(_db.takes).insert(
            TakesCompanion.insert(
              shotId: shotId,
              takeNumber: t,
              createdAt: now,
            ),
          );
        }
      }
    }
    // Fetch counts
    _slateCount = (await _db.select(_db.slates).get()).length;
    _shotCount = (await _db.select(_db.shots).get()).length;
    _takeCount = (await _db.select(_db.takes).get()).length;
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _loading ? null : _loadDemoData,
              child: Text(_loading ? 'Loading...' : 'Load Demo Data'),
            ),
            const SizedBox(height: 16),
            if (!_loading && _slateCount > 0) ...[
              Text('Slates: $_slateCount'),
              Text('Shots: $_shotCount'),
              Text('Takes: $_takeCount'),
            ],
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('New Shot'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('New Take'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
