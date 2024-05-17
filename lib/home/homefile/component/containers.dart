import 'package:flutter/material.dart';


InputDecoration buildInputDecorationText(
    {required String titletxt, required Icon iconfind}) {
  return InputDecoration(
    prefixIcon: iconfind,
    label: Text(
      titletxt.toString(),
      style: const TextStyle(color: Colors.black),
    ),
    border:
        const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
  );
}

Widget buildSizedBoxText(
    {required double w,
    required TextEditingController controller,
    required Icon iconfind,
    required String titletxt,
    required TextInputAction textactionfind}) {
  return SizedBox(
    width: w / 1.2,
    child: TextFormField(
      textInputAction: textactionfind,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Filed Must Be Required';
        }
        return null;
      },
      controller: controller,
      decoration:
          buildInputDecorationText(iconfind: iconfind, titletxt: titletxt),
    ),
  );
}
