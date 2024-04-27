import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_bottom_sheet.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showCustomModalBottomSheet(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          500,
        ),
      ),
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF105587),
      child: const Icon(
        Icons.add,
      ),
    );
  }
}

showCustomModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(18),
      ),
    ),
    context: context,
    builder: (context) {
      return const CustomBottomSheet();
    },
  );
}
