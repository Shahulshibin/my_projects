import 'package:flutter/material.dart';
import '../models/note.dart';
import 'add_note_screen.dart';
import '../widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> _notes = [];

  void _addNote(Note note) {
    setState(() {
      _notes.add(note);
    });
  }

  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quick Notes')),
      body: _notes.isEmpty
          ? Center(child: Text('No notes yet. Tap + to add one.'))
          : ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (ctx, index) => NoteCard(
                note: _notes[index],
                onDelete: () => _deleteNote(index),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push<Note>(
            MaterialPageRoute(builder: (_) => AddNoteScreen()),
          );
          if (result != null) _addNote(result);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
