import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/cubits/notes/notes_states.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_floating_action_button.dart';
import 'package:note_app/widgets/note_item.dart';

class FirstView extends StatefulWidget {
  const FirstView({super.key});
  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  bool v = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const CustomAppBar(title: 'Notes'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: BlocBuilder<NoteCubit, NoteStates>(
                builder: (context, state) {
                  List<NoteModel> notes =
                      BlocProvider.of<NoteCubit>(context).notesModel!;
                  return ListView.builder(
                    itemCount: notes.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => NoteItem(
                      note: notes[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
