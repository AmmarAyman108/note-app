abstract class AddNoteStates {}

class AddNoteInitialState extends AddNoteStates {}

class AddNoteLoadingState extends AddNoteStates {}

class AddNoteSuccessState extends AddNoteStates {}

class AddNoteFailureState extends AddNoteStates {
  String message;
  AddNoteFailureState(this.message);
}
