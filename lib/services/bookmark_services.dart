import 'package:ecocycle/models/bookmark_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBBookmark {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initialize();
    return _database!;
  }

  Future<String> fullPath() async {
    const name = 'database_bookmark.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath();
    var database = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    return database;
  }

  Future<void> create(Database database, int version) async =>
      await database.execute(
          'CREATE TABLE bookmark(id INTEGER PRIMARY KEY, author TEXT, title TEXT, description TEXT, url TEXT, urlToImage TEXT, publishedAt TEXT, content TEXT)');

  Future<void> insert(Bookmark bookmark) async {
    final db = await database;
    await db.insert('bookmark', bookmark.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Bookmark>> list() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('bookmark');

    return List.generate(maps.length, (i) {
      return Bookmark(
        id: maps[i]['id'],
        author: maps[i]['author'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        url: maps[i]['url'],
        urlToImage: maps[i]['urlToImage'],
        publishedAt: maps[i]['publishedAt'],
        content: maps[i]['content'],
      );
    });
  }

  Future<void> update(Bookmark bookmark) async {
    final db = await database;
    await db.update(
      'bookmark',
      bookmark.toMap(),
      where: 'id = ?',
      whereArgs: [bookmark.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await database;
    await db.delete(
      'bookmark',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  getLastId() async {
    final db = await database;
    var table = await db.rawQuery('SELECT MAX(id) as id FROM bookmark');
    int id = int.parse(table.first['id'].toString());
    return id;
  }

  getTitleinBookmark(String title) async {
    final db = await database;
    var table =
        await db.rawQuery('SELECT title FROM bookmark WHERE title = "$title"');
    return table.first['title'].toString();
  }
}
