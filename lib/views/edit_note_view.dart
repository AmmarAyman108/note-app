import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class EditNoteView extends StatefulWidget {
  EditNoteView({super.key, required this.oldNote});
  NoteModel oldNote;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  TextEditingController title = TextEditingController();

  TextEditingController content = TextEditingController();
  @override
  void initState() {
    title.text = widget.oldNote.title;
    content.text = widget.oldNote.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            alignment: Alignment.center,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white.withOpacity(.05)),
            child: IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () async {
                widget.oldNote.title = title.text;
                widget.oldNote.content = content.text;
                widget.oldNote.save();
                BlocProvider.of<NoteCubit>(context).readAllNotes();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                size: 30,
              ),
            ),
          ),
        ],
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
        ),
        title: const Text(
          'Edit Note',
          style: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 80,
              left: 10,
              right: 10,
            ),
            child: CustomTextField(
              controller: title,
              hint: 'Title',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
            ),
            child: CustomTextField(
              controller: content,
              hint: 'Content',
              maxLines: 5,
              circular: 16,
            ),
          ),
        ],
      ),
    );
  }
}
