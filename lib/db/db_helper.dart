import 'package:mobilefirst/models/product/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHeler {
  static final DbHeler instance = DbHeler._init();
  static Database? _database;
  DbHeler._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDb('products.db');
    return _database!;
  }

  Future<Database> initDb(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE product (
          id INTEGER PRIMARY KEY,
          prodId TEXT,
          prodImage TEXT,
          prodCode TEXT,
          prodName TEXT,
          prodMrp TEXT
        )
      ''');
    });
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<List<ProductModel>> getProducts() async {
    final db = await instance.database;
    var response = await db.query('product');
    return response.map((article) => ProductModel.fromJson(article)).toList();
  }

  Future insertProducts(List<ProductModel> products) async {
    try {
      final db = await instance.database;

      Batch batch = db.batch();
      for (var product in products) {
        ProductModel pro = ProductModel();
        pro.prodId = product.prodId;
        pro.prodImage = product.prodImage;
        pro.prodCode = product.prodCode;
        pro.prodName = product.prodName;
        pro.prodMrp = product.prodMrp;
        batch.insert('product', pro.toJson());
      }
      batch.commit();
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
