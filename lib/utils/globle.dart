import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

TextEditingController txtName = TextEditingController();
TextEditingController txtSurname=TextEditingController();
TextEditingController txtPhone=TextEditingController();
GlobalKey<FormState> fromkey = GlobalKey();
GlobalKey<FormState> fromkeyNumber=GlobalKey();
ImagePicker imagePicker=ImagePicker();
File? fileImage;

List hobbey=[];
List checkhobby=List.filled(3, false);
List hobbyname=[
  'Sports',
  'Writing',
  'Reading'
];
String name='';
String surname='';
String phonenumber='';
String gender='Male';
