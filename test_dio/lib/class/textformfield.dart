import 'package:flutter/material.dart';

class TextFromFieldClass extends StatelessWidget {
  const TextFromFieldClass(
      {super.key,
      required this.prefixIcons,
      required this.textController,
      required this.suffixIcons,
      this.showPassword = false,
      required this.onTaps});

  final Icon prefixIcons;
  final Icon suffixIcons;
  final TextEditingController textController;
  final bool showPassword;
  final VoidCallback onTaps;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: showPassword,
      style: const TextStyle(
          fontSize: 18, color: Colors.white70, fontFamily: 'NotoSansRegular'),
      decoration: InputDecoration(
        prefixIcon: prefixIcons,
        prefixIconColor: Colors.blueGrey[900],
        suffixIcon: GestureDetector(
          onTap: () {
            onTaps();
          },
          child: suffixIcons,
        ),
        suffixIconColor: Colors.blueGrey[900],
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff1d3557), width: 2),
        ),
      ),
    );
  }
}
