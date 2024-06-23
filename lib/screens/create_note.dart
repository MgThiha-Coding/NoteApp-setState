import 'package:flutter/material.dart';
import 'package:ninja_note/models/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key, required this.onNewNoteCreated});

  final Function(Note) onNewNoteCreated;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titlecontroller = TextEditingController();
  final bodycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        elevation: 40,
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: titlecontroller,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: bodycontroller,
              style: TextStyle(
                fontSize: 20,
                color: Colors.amber,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Your Story",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titlecontroller.text.isEmpty || bodycontroller.text.isEmpty) {
            return;
          }
          // if text are empty "return" will work , it excuate nothing
          // if text are not empty "return" will not work , it excuate and continue to next step
          final note = Note(
            title: titlecontroller.text,
            body: bodycontroller.text,
          );
          // store data to titlecontroller.text and bodycontroller.text
          // store that data to note variable
          widget.onNewNoteCreated(note);
          Navigator.of(context).pop();
          // and pop to previous screen by calling function "onNewNoteCreated"
          // by carrying data with variable note // data are stroring in note
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
