import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/note_cubit/add_note_cubit.dart';
import 'package:note_app/widgets/color_item.dart';

class ColorList extends StatefulWidget {
  const ColorList({super.key});

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xFFAC3931),
    Color(0xFFE5D352),
    Color(0xFFD9E76C),
    Color(0xFF537D8D),
    Color(0xFF482C3D),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 70,
          child: ListView.builder(
            itemCount: colors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    BlocProvider.of<AddNoteCubit>(context).color =
                        colors[index];
                  });
                },
                child: ColorItem(
                  color: colors[index],
                  isActive: currentIndex == index,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
