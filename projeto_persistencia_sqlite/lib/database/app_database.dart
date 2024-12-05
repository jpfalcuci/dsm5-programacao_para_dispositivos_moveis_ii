import 'package:path/path.dart';
import 'package:projeto_persistencia_sqlite/models/contact.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'banco.db');
      return openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute('CREATE TABLE contacts('
              'id INTEGER PRIMARY KEY,'
              'name TEXT,'
              'accountNumber INTEGER)');
        },
        // onDowngrade: onDatabaseDowngradeDelete,
      );
    },
  );
}

Future<int> save(Contact contact) {
  return createDatabase().then(
    (db) {
      final Map<String, dynamic> contactMap = {};
      contactMap['name'] = contact.name;
      contactMap['accountNumber'] = contact.accountNumber;
      return db.insert('contacts', contactMap);
    },
  );
}

Future<List<Contact>> findAll() {
  return createDatabase().then(
    (db) {
      return db.query('contacts').then(
        (maps) {
          final List<Contact> contacts = [];
          for (Map<String, dynamic> map in maps) {
            final Contact contact = Contact(
              map['id'],
              map['name'],
              map['accountNumber'],
            );
            contacts.add(contact);
          }
          return contacts;
        },
      );
    },
  );
}
