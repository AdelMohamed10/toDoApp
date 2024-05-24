import 'dart:developer';
import 'dart:typed_data';
import 'package:commerce_project/dashboard/modules/task/model/entity_model/task_model.dart';
import 'package:commerce_project/dashboard/modules/task/model/entity_model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // Add this import

class DatabaseRepo {
  late Database myObjectDB;

  Future<void> initDB() async {
    String dbPath = join(await getDatabasesPath(), 'taskDB.db'); // Use join to handle path separators
    myObjectDB = await openDatabase(
      dbPath,
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
            missed INTEGER DEFAULT 0
          )''');
        await db.execute('''
          CREATE TABLE user (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fname TEXT NOT NULL,
            lname TEXT NOT NULL,
            email TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL
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

  // User-related methods
  Future<void> insertUserData(String fname, String lname, String email, String password) async {
    try {
      await myObjectDB.insert('user', {
        'fname': fname,
        'lname': lname,
        'email': email,
        'password': password,
      });
    } catch (e) {
      log('Error inserting user data: $e');
    }
  }

  Future<UserModel?> fetchUserByEmail(String email) async {
    try {
      final List<Map<String, dynamic>> maps = await myObjectDB.query('user', where: 'email = ?', whereArgs: [email]);
      if (maps.isNotEmpty) {
        return UserModel.fromJson(maps.first);
      }
    } catch (e) {
      log('Error fetching user by email: $e');
    }
    return null;
  }

  Future<void> updateFName(String value, int id) async {
    try {
      log('Updating first name for user id: $id');
      await myObjectDB.update(
        'user',
        {'fname': value},
        where: 'id=?',
        whereArgs: [id],
      );
    } catch (e) {
      log('Error updating first name: $e');
    }
  }

  Future<void> updateLName(String value, int id) async {
    try {
      log('Updating last name for user id: $id');
      await myObjectDB.update(
        'user',
        {'lname': value},
        where: 'id=?',
        whereArgs: [id],
      );
    } catch (e) {
      log('Error updating last name: $e');
    }
  }

  Future<void> updateEmail(String value, int id) async {
    try {
      log('Updating email for user id: $id');
      await myObjectDB.update(
        'user',
        {'email': value},
        where: 'id=?',
        whereArgs: [id],
      );
    } catch (e) {
      log('Error updating email: $e');
    }
  }

  Future<void> updatePassword(String value, int id) async {
    try {
      log('Updating password for user id: $id');
      await myObjectDB.update(
        'user',
        {'password': value},
        where: 'id=?',
        whereArgs: [id],
      );
    } catch (e) {
      log('Error updating password: $e');
    }
  }

  Future<List<TaskModel>> fetchTasks() async {
    try {
      log('Fetching tasks');
      return (await myObjectDB.query('task')).map((e) => TaskModel.fromJson(e)).toList();
    } catch (e) {
      log('Error fetching tasks: $e');
      return [];
    }
  }

  Future<List<TaskModel>> fetchDoneTasks() async {
    try {
      log('Fetching done tasks');
      return (await myObjectDB.query('task', where: 'done=?', whereArgs: [1]))
          .map((e) => TaskModel.fromJson(e))
          .toList();
    } catch (e) {
      log('Error fetching done tasks: $e');
      return [];
    }
  }

  Future<List<TaskModel>> fetchMissedTasks() async {
    try {
      log('Fetching missed tasks');
      final tasks = await myObjectDB.query('task', where: 'missed = ?', whereArgs: [1]);
      return tasks.map((e) => TaskModel.fromJson(e)).toList();
    } catch (e) {
      log('Error fetching missed tasks: $e');
      return [];
    }
  }

  Future<void> insertTask(String name, String desc, int times, int availableTimes, Uint8List image) async {
    try {
      log('Inserting task: $name');
      await myObjectDB.insert('task', {
        'name': name,
        'description': desc,
        'times': times,
        'availableTimes': availableTimes,
        'image': image,
        'done': 0,
        'missed': 0
      });
    } catch (e) {
      log('Error inserting task: $e');
    }
  }

  void newTimes(int tms, int id) async {
    try {
      log('Updating times for task id: $id');
      await myObjectDB.update(
        'task',
        {'availableTimes': tms},
        where: 'id=?',
        whereArgs: [id],
      );
    } catch (e) {
      log('Error updating times: $e');
    }
  }

  Future<void> updateMissed(int value, int id) async {
    try {
      log('Updating missed status for task id: $id');
      await myObjectDB.update(
        'task',
        {'missed': value},
        where: 'id=?',
        whereArgs: [id],
      );
    } catch (e) {
      log('Error updating missed status: $e');
    }
  }

  Future<void> updateDone(int value, int id) async {
    try {
      log('Updating done status for task id: $id');
      await myObjectDB.update(
        'task',
        {'done': value},
        where: 'id=?',
        whereArgs: [id],
      );
    } catch (e) {
      log('Error updating done status: $e');
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      log('Deleting task with id: $id');
      await myObjectDB.delete('task', where: 'id=?', whereArgs: [id]);
    } catch (e) {
      log('Error deleting task: $e');
    }
  }

  // Method to delete the database and reinitialize it
  Future<void> deleteAndReinitializeDB() async {
    try {
      String path = join(await getDatabasesPath(), 'taskDB.db');
      await deleteDatabase(path);
      await initDB();
    } catch (e) {
      log('Error deleting and reinitializing database: $e');
    }
  }
}
