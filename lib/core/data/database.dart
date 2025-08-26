import 'package:drift/drift.dart';
import 'package:drift/web.dart'; // pre web IndexedDB

part 'database.g.dart';

@DriftDatabase(tables: [ /* tvoje tabuľky */ ])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(WebDatabase('vfx_sheet'));

  @override
  int get schemaVersion => 1;
}

class Projects extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text()();
  TextColumn get title => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime);
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class ShootingDays extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get projectId => integer()();
  DateTimeColumn get date => dateTime()();
}

class Slates extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dayId => integer()();
  TextColumn get slateCode => text()();
  TextColumn get description => text().nullable()();
}

class Shots extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get slateId => integer()();
  TextColumn get shotCode => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime);
}

class Takes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get shotId => integer()();
  IntColumn get takeNumber => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime);
}

  Future<void> seed() async {
    // Implement seeding logic in later steps
  }
}
