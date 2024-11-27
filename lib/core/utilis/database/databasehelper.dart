import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseHelper {
  static const _dbName = "ProductsDatabase.db";
  static const _dbVersion = 1;
  static const _tableName = "products";
  static const columnBarcode = "barcode";
  static const columnBrand = "brand";
  static const columnCategory = "category";
  static const columnItem = "item";
  static const columnDescription = "description";
  static const columnUnit = "unit";
  static const columnUnitPrice = "unit_price";
  static const columnItemPhoto = "item_photo";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }
Future<List<Map<String, dynamic>>> fetchAllProducts() async {
    final db = await database; // Your database instance
    return await db.query('products'); // Assuming 'products' is your table name
  }
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        $columnBarcode TEXT PRIMARY KEY,
        $columnBrand TEXT,
        $columnCategory TEXT,
        $columnItem TEXT,
        $columnDescription TEXT,
        $columnUnit TEXT,
        $columnUnitPrice TEXT,
        $columnItemPhoto TEXT
      )
    ''');
  }

  Future<void> insertOrUpdateProduct(Map<String, dynamic> product) async {
    Database db = await database;
    await db.insert(_tableName, product, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Map<String, dynamic>?> getProductByBarcode(String barcode) async {
    Database db = await database;
    final result = await db.query(_tableName, where: "$columnBarcode = ?", whereArgs: [barcode]);
    return result.isNotEmpty ? result.first : null;
  }
}
