import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:id_card_rgistration_form/utils/globle.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        color: Colors.white,
        child: Stack(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(flip: true),
              child: Container(
                height: 200,
                color: const Color(0xff29A8CB),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.7),
              child: ClipPath(
                clipper: WaveClipperTwo(reverse: true),
                child: Container(
                  color: const Color(0xff1E609D),
                  height: 70,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.66),
              child: ClipPath(
                clipper: WaveClipperTwo(reverse: true),
                child: Container(
                  color: const Color(0xff2A77AA),
                  height: 70,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.5),
              child: ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  color: const Color(0xff2A77AA),
                  height: 60,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.83),
              child: CircleAvatar(
                radius: 85,
                backgroundColor: const Color(0xc9245fa0),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      (null != fileImage) ? FileImage(fileImage!) : null,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.55),
              child: SizedBox(
                // color: Colors.blue,
                height: 400,
                width: w / 1.2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$name $surname',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Reading',
                          style: TextStyle(color: Colors.black45, fontSize: 25),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    buildRowText(textfeildfind: 'Gender', textfind: gender),
                    buildRowText(
                        textfeildfind: 'Phone No', textfind: phonenumber),
                    buildRowTexthobby(
                      textfeildfind: 'Hobby',
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: WaveClipperTwo(reverse: true),
                child: Container(
                  height: 70,
                  color: const Color(0xff4AB7D7),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRowText({required String textfeildfind, required String textfind}) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$textfeildfind : ',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: '$textfind',
                style: const TextStyle(color: Colors.black45, fontSize: 25),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildRowTexthobby(
      {required String textfeildfind}) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$textfeildfind : ',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              ...List.generate(hobbey.length, (index) => TextSpan(text:(index<hobbey.length-1)?hobbey[index]+',':hobbey[index],style: const TextStyle(color: Colors.black45,fontSize: 20))),
              (hobbey!.isEmpty)?const TextSpan(text: '  -',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)):const TextSpan(text: ''),
            ],
          ),
        ),
      ],
    );
  }
}
