import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'features/day_dashboard/day_dashboard.dart';
import 'features/shots/shots.dart';
import 'features/camera_lens/camera_lens.dart';
import 'features/exports/exports.dart';
import 'features/settings/settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VfxSheetApp());
}

class VfxSheetApp extends StatelessWidget {
  const VfxSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'On-Set VFX Sheet',
      theme: ThemeData.dark(useMaterial3: true),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('sk', ''),
      ],
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DayDashboardPage(),
    ShotsPage(),
    CameraLensPage(),
    ExportsPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Day'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Shots'),
          BottomNavigationBarItem(icon: Icon(Icons.photo_camera), label: 'Camera/Lens'),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Exports'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
