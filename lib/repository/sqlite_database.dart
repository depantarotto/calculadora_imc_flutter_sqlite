import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  1: '''
    CREATE TABLE tab_dados_imc (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    peso REAL,
    altura REAL
    );
'''
};

class SqliteDatabase {
  static Database? db;

  Future<Database> iniciar() async {
    var db = openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: scripts.length,
      onCreate: (db, version) async {
        for (var i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        for (var i = oldVersion; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
    );
    return db;
  }

  Future<Database> obterDataBase() async {
    if (db == null) {
      return await iniciar();
    } else {
      return db!;
    }
  }
}
