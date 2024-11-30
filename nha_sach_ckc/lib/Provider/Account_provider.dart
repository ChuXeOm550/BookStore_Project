
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';


class AccountProvider {
  late Database db;

  Future open() async{
    if(kIsWeb){
      databaseFactory = databaseFactoryFfiWeb;
    }else{
      if(Platform.isWindows||Platform.isLinux){
        sqfliteFfiInit();
        databaseFactory=databaseFactoryFfi;
      }
    }
    db=await openDatabase(
      join(await getDatabasesPath(), 'account_database.db'),
      onCreate: (db,version){
        return db.execute(
          'CREATE TABLE accounts'
        )
      }
    )
  }
}