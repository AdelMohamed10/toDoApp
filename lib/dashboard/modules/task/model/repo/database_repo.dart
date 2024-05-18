import 'dart:developer';
import 'dart:typed_data';
import 'package:commerce_project/dashboard/modules/task/model/entity_model/task_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo {
  late Database myObjectDB;

  Future<void> initDB() async {
    myObjectDB = await openDatabase(
      (await getDatabasesPath()) + '/taskDB.db',
      version: 2, // Increment version for migration
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE task (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            description TEXT, 
            image BLOB,
            times INTEGER,
            availableTimes INTEGER,
            done INTEGER,
            missed INTEGER
          )''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE task ADD COLUMN missed INTEGER DEFAULT 0');
        }
        // Add future migrations here
      },
    );
  }

  Future<List<TaskModel>> fetchTasks() async {
    log('Fetching tasks');
    return (await myObjectDB.query('task')).map((e) => TaskModel.fromJson(e)).toList();
  }

  Future<List<TaskModel>> fetchDoneTasks() async {
    log('Fetching done tasks');
    return (await myObjectDB.query('task', where: 'done=?', whereArgs: [1]))
        .map((e) => TaskModel.fromJson(e))
        .toList();
  }

  Future<List<TaskModel>> fetchMissedTasks() async {
    try {
      log('Fetching missed tasks');
      final tasks = await myObjectDB.query('task', where: 'missed = ?', whereArgs: [1]);
      return tasks.map((e) => TaskModel.fromJson(e)).toList();
    } catch (e) {
      log('Error fetching missed tasks: $e');
      // Handle the error (e.g., return an empty list or rethrow the exception).
      return [];
    }
  }

  Future<void> insertTask(String name, String desc, int times, int availableTimes, Uint8List image) async {
    log('Inserting task: $name');
    await myObjectDB.insert('task', {
      'name': name,
      'description': desc,
      'times': times,
      'availableTimes': availableTimes,
      'image': image,
      'done': 0,
      'missed': 0,
    });
  }

  void newTimes(int tms, int id) {
    log('Updating times for task id: $id');
    myObjectDB.update(
      'task',
      {'availableTimes': tms},
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<void> updateMissed(int value, int id) async {
    log('Updating missed status for task id: $id');
    await myObjectDB.update(
      'task',
      {'missed': value},
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<void> updateDone(int value, int id) async {
    log('Updating done status for task id: $id');
    await myObjectDB.update(
      'task',
      {'done': value},
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTask(int id) async {
    log('Deleting task with id: $id');
    await myObjectDB.delete('task', where: 'id=?', whereArgs: [id]);
  }

  // Method to delete the database and reinitialize it
  Future<void> deleteAndReinitializeDB() async {
    String path = (await getDatabasesPath()) + '/taskDB.db';
    await deleteDatabase(path);
    await initDB();
  }
}
