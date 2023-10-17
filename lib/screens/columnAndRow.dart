import 'package:flutter/material.dart';

class ColumnAndRow extends StatelessWidget {
  const ColumnAndRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6b6b47),
        title: Text(
          'Column and Row',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
          width: double.infinity,
          height: double.infinity,
          color: Color(0xffe5e5cb),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 28,
                    width: 28,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 9, color: Color(0xff659a9d))),
                  ),
                  Container(
                    height: 28,
                    width: 28,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 9, color: Color(0xff659a9d))),
                  ),
                ],
              ),
              Container(
                color: Color(0xfffef0e5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xffcc6503),
                        ),
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xfffe8a19),
                        ),
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xfffcb267),
                        ),
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xfffdcb68),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xffcc6503),
                        ),
                        Container(
                          height: 20,
                          width: 70,
                          color: Color(0xfffe8a19),
                        ),
                        Container(
                          height: 20,
                          width: 40,
                          color: Color(0xfffcb267),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          color: Color(0xfffdcb68),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 25,
                          color: Color(0xffcc6503),
                        ),
                        Container(
                          height: 70,
                          width: 25,
                          color: Color(0xfffe8a19),
                        ),
                        Container(
                          height: 40,
                          width: 20,
                          color: Color(0xfffcb267),
                        ),
                        Container(
                          height: 15,
                          width: 20,
                          color: Color(0xfffdcb68),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 90,
                          width: 22.5,
                          color: Color(0xffcc6503),
                        ),
                        Container(
                          height: 90,
                          width: 22.5,
                          color: Color(0xfffe8a19),
                        ),
                        Container(
                          height: 90,
                          width: 22.5,
                          color: Color(0xfffcb267),
                        ),
                        Container(
                          height: 90,
                          width: 22.5,
                          color: Color(0xfffdcb68),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xffe7ffe7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xff01b23d),
                        ),
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xff73e402),
                        ),
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xffade400),
                        ),
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xffccf35a),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xff01b23d),
                        ),
                        Container(
                          height: 20,
                          width: 70,
                          color: Color(0xff73e402),
                        ),
                        Container(
                          height: 20,
                          width: 40,
                          color: Color(0xffade400),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          color: Color(0xffccf35a),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 90,
                          width: 25,
                          color: Color(0xff01b23d),
                        ),
                        Container(
                          height: 70,
                          width: 25,
                          color: Color(0xff73e402),
                        ),
                        Container(
                          height: 40,
                          width: 20,
                          color: Color(0xffade400),
                        ),
                        Container(
                          height: 15,
                          width: 20,
                          color: Color(0xffccf35a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 90,
                          width: 22.5,
                          color: Color(0xff01b23d),
                        ),
                        Container(
                          height: 90,
                          width: 22.5,
                          color: Color(0xff73e402),
                        ),
                        Container(
                          height: 90,
                          width: 22.5,
                          color: Color(0xffade400),
                        ),
                        Container(
                          height: 90,
                          width: 22.5,
                          color: Color(0xffccf35a),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xffeee6fe),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xff8100ff),
                        ),
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xffb381fe),
                        ),
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xffea99fc),
                        ),
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xfffcb4e9),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 20,
                          width: 90,
                          color: Color(0xff8100ff),
                        ),
                        Container(
                          height: 20,
                          width: 70,
                          color: Color(0xffb381fe),
                        ),
                        Container(
                          height: 20,
                          width: 40,
                          color: Color(0xffea99fc),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          color: Color(0xfffcb4e9),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 90,
                          width: 25,
                          color: Color(0xff8100ff),
                        ),
                        Container(
                          height: 70,
                          width: 25,
                          color: Color(0xffb381fe),
                        ),
                        Container(
                          height: 40,
                          width: 20,
                          color: Color(0xffea99fc),
                        ),
                        Container(
                          height: 15,
                          width: 20,
                          color: Color(0xfffcb4e9),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 90,
                          width: 22.5,
                          color: Color(0xff8100ff),
                        ),
                        Container(
                          height: 90,
                          width: 22.5,
                          color: Color(0xffb381fe),
                        ),
                        Container(
                          height: 90,
                          width: 22.5,
                          color: Color(0xffea99fc),
                        ),
                        Container(
                          height: 90,
                          width: 22.5,
                          color: Color(0xfffcb4e9),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 28,
                    width: 28,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 9, color: Color(0xff659a9d))),
                  ),
                  Container(
                    height: 28,
                    width: 28,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 9, color: Color(0xff659a9d))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
