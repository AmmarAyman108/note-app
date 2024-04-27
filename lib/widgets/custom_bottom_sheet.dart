import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/note_cubit/add_note_states.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/color_list.dart';
import 'package:note_app/widgets/custom_bottom.dart';
import 'package:note_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: CustomTextField(
                  hint: 'Title',
                  controller: title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: CustomTextField(
                    hint: 'Content',
                    controller: content,
                    maxLines: 5,
                    circular: 16),
              ),
               BlocProvider(
                create: (context) => AddNoteCubit(),
                child: const ColorList(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                  bottom: 20,
                ),
                child: BlocProvider(
                  create: (context) => AddNoteCubit(),
                  child: CustomBottom(
                    child: BlocBuilder<AddNoteCubit, AddNoteStates>(
                      builder: (context, state) {
                        if (state is AddNoteLoadingState) {
                          return const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        } else if (state is AddNoteFailureState) {
                          return Text(
                            state.message.substring(0, 5),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 17, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return const Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                      },
                    ),
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        var currentDate = DateTime.now();
                        var formatCurrentDate =
                            DateFormat('dd/mm/yyyy').format(currentDate);
                        formKey.currentState!.save();
                        NoteModel noteModel = NoteModel(
                            color: const Color(0xFF105587).value,
                            date: formatCurrentDate,
                            content: content.text,
                            title: title.text);
                        BlocProvider.of<AddNoteCubit>(context)
                            .addNote(noteModel);
                        title.clear();
                        content.clear();
                        BlocProvider.of<NoteCubit>(context).readAllNotes();
                        Navigator.pop(context);
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
