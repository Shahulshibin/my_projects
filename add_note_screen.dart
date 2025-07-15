import 'package:flutter/material.dart';
import '../models/note.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _saveNote() {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) return;

    final newNote = Note(
      title: _titleController.text,
      content: _contentController.text,
      createdAt: DateTime.now(),
    );

    Navigator.of(context).pop(newNote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Note')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Title')),
            SizedBox(height: 10),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 5,
            ),
            Spacer(),
            ElevatedButton(onPressed: _saveNote, child: Text('Save')),
          ],
        ),
      ),
    );
  }
}
