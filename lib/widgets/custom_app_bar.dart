import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/theme_cubit/theme_cubit.dart';
import 'package:note_app/cubits/theme_cubit/theme_state.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 31,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          BlocProvider(
            create: (context) => ThemeCubit(),
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                if (state is InitialState || state is LightThemeState) {
                  return IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        BlocProvider.of<ThemeCubit>(context).theme(context);
                      },
                      icon: const Icon(Icons.dark_mode));
                } else {
                  return IconButton(
                      padding: EdgeInsets.zero,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        BlocProvider.of<ThemeCubit>(context).theme(context);
                      },
                      icon: const Icon(Icons.light_mode));
                }
              },
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(left: 10),
          //   alignment: Alignment.center,
          //   width: 40,
          //   height: 40,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(12),
          //       color: Colors.white.withOpacity(.05),
          // ),
          //   child: IconButton(
          //       highlightColor: Colors.transparent,
          //       splashColor: Colors.transparent,
          //       onPressed: () {},
          //       icon: const Icon(
          //         Icons.search,
          //         size: 30,
          //       )),
          // ),
        ],
      ),
    );
  }
}
