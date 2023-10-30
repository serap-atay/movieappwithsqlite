import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteHelper {

  static const String databaseName = "movies.sqlite";

  static Future<Database> databaseAccess () async{

    String databasePath = join(await getDatabasesPath(),"movies.sqlite");

    if(await databaseExists(databasePath)){
      print("Veritabanı zaten var.");
    }else{
      ByteData data = await rootBundle.load("database/$databaseName");

      List<int> bytes = data.buffer.asInt8List(data.offsetInBytes,data.lengthInBytes);

      await File(databasePath).writeAsBytes(bytes, flush: true);
      print("Veritabanı kopyalandı.");
    }
    return openDatabase(databasePath);
  }
}