

class CharacterTable {
  static String createTable() {
    return '''
    CREATE TABLE characters (
      id INTEGER PRIMARY KEY,
      name TEXT,
      custom_name TEXT,
      status TEXT,
      species TEXT,
      image TEXT,
      created_at TEXT DEFAULT CURRENT_TIMESTAMP
    );
    ''';
  }
}