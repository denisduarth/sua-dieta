import 'package:sqflite/sqflite.dart';
import 'package:sua_dieta/models/diet.dart';

class DietController {
  Future<Database> getDatabase() async {
    var path = await getDatabasesPath();
    path += 'BancoTaco.db';

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Diet (id INTEGER PRIMARY KEY autoincrement, name TEXT)');
    });

    return database;
  }

  Future<void> create(Diet diet) async {
    var database = await getDatabase();
    await database.insert('Diet', diet.toMap());
    await database.close();
  }

  Future<List<Map>> read() async {
    var database = await getDatabase();
    List<Map> tasks = await database.rawQuery('SELECT * FROM Task');
    await database.close();
    return tasks;
  }

  Future<void> update(Diet diet) async {
    var database = await getDatabase();
    await database
        .update('Diet', diet.toMap(), where: 'id = ?', whereArgs: [diet.id]);
    await database.close();
  }

  Future<void> delete(Diet diet) async {
    var database = await getDatabase();
    await database.delete('Task', where: 'id = ?', whereArgs: [diet.id]);
    await database.close();
  }
}
