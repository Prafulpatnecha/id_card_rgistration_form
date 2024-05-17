import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/globle.dart';
import 'component/containers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'ID Card Registration Form',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        color: Colors.white,
        child: Form(
          key: fromkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.blue,
                      backgroundImage: (null!=fileImage)?FileImage(fileImage!):null,
                      child: IconButton(
                          onPressed: () async {
                            XFile? xfileImage=await imagePicker.pickImage(source: ImageSource.camera);
                            setState(() {
                              fileImage=File(xfileImage!.path);
                            });
                          }, icon: const SizedBox(
                        width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.camera),
                              ],
                            ),
                          )),
                    ),
                    IconButton(
                      onPressed: () async {
                        XFile? xfileImage=await imagePicker.pickImage(source: ImageSource.gallery);
                        setState(() {
                        fileImage =File(xfileImage!.path);
                        });
                      },
                      icon: const Icon(
                        Icons.image,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildSizedBoxText(
                        textactionfind: TextInputAction.next,
                        controller: txtName,
                        w: w / 1.9,
                        iconfind: const Icon(Icons.drive_file_rename_outline),
                        titletxt: 'Name'),
                    buildSizedBoxText(
                        w: w / 1.9,
                        controller: txtSurname,
                        iconfind:
                            const Icon(Icons.drive_file_rename_outline_rounded),
                        titletxt: 'Surname',
                        textactionfind: TextInputAction.next)
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: fromkeyNumber,
                  child: Column(
                    children: [
                      SizedBox(
                        width: w / 1.1,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Filed Must Be Required';
                            } else if (value.length != 10) {
                              return 'Only 1-10 Number Is Allow';
                            }
                            return null;
                          },
                          controller: txtPhone,
                          decoration: buildInputDecorationText(
                              titletxt: 'Phone No.',
                              iconfind: const Icon(Icons.phone)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      genderBoxRadio(w),
                      const SizedBox(height: 20,),
                      const Text("Hobby ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(
                        width: w/1.011,
                        child: Row(
                          children: [
                            ...List.generate(checkhobby.length, (index) =>
                            Row(
                              children: [
                                Checkbox(value: checkhobby[index], onChanged: (value) {
                                  setState(() {
                                    if(checkhobby[index]==false)
                                      {
                                        checkhobby[index]=true;
                                        hobbey.add(hobbyname[index]);
                                      }
                                    else
                                      {
                                        checkhobby[index]=false;
                                        hobbey.remove(hobbyname[index]);
                                      }
                                  });
                                },),
                                Text(hobbyname[index].toString(),style: const TextStyle(fontSize: 18),),
                              ],
                            ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          fromkeyNumber.currentState!.validate();
                          if(fromkey.currentState!.validate() && fromkeyNumber.currentState!.validate())
                            {
                              name=txtName.text;
                              surname=txtSurname.text;
                              phonenumber=txtPhone.text;
                              if(fileImage!=null)
                              {
                              Navigator.of(context).pushNamed('/view');
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Image Must be required')));
                              }
                            }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox genderBoxRadio(double w) {
    return SizedBox(
                      width: w / 1.1,
                      child: Row(
                        children: [
                          const Text(
                            'Gender',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
                          ),
                          Radio(
                            value: gender,
                            groupValue: 'Male',
                            onChanged: (value) {
                              setState(() {
                                gender = 'Male';
                              });
                            },
                          ),
                          const Text(
                            'Male',
                            style: TextStyle(fontSize: 18,),
                          ),
                          Radio(
                            value: gender,
                            groupValue: 'Female',
                            onChanged: (value) {
                              setState(() {
                                gender = 'Female';
                              });
                            },
                          ),
                          const Text(
                            'Female',
                            style: TextStyle(fontSize: 18),
                          ),
                          Radio(
                            value: gender,
                            groupValue: 'Other',
                            onChanged: (value) {
                              setState(() {
                                gender = 'Other';
                              });
                            },
                          ),
                          const Text(
                            'Other',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    );
  }
}
