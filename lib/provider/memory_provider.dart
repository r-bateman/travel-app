import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/memory.dart';

class MemoryProvider {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addEntry(Memory memory) async {
    await _db.collection('journal_entries').add({
      'caption': memory.caption,
      'description': memory.description,
      'created_at': Timestamp.fromDate(memory.createdAt),
    });
  }
}