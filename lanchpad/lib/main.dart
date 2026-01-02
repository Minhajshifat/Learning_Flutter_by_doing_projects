import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hit The Bits",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Hit The Bits",
              style: GoogleFonts.orbitron(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body:SafeArea(
            child: Center(
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  bits(Color(0xFF00C9FF), Color(0xFF92FE9D), "1.mp3"),
                  bits(Color(0xFF00C9FF), Color(0xFF92FE9D), "2.mp3"),
                  bits(Color(0xFF00C9FF), Color(0xFF92FE9D), "3.mp3"),
                  bits(Color(0xFF00C9FF), Color(0xFF92FE9D), "4.mp3"),
                  bits(Color(0xFF36D1DC), Color(0xFF5B86E5), "5.mp3"),
                  bits(Color(0xFF36D1DC), Color(0xFF5B86E5), "6.mp3"),
                  bits(Color(0xFF36D1DC), Color(0xFF5B86E5), "7.mp3"),
                  bits(Color(0xFF36D1DC), Color(0xFF5B86E5), "8.mp3"),
                  bits(Color(0xFF43E97B), Color(0xFF38F9D7), "9.mp3"),
                  bits(Color(0xFF43E97B), Color(0xFF38F9D7), "10.mp3"),
                  bits(Color(0xFF43E97B), Color(0xFF38F9D7), "11.mp3"),
                  bits(Color(0xFF43E97B), Color(0xFF38F9D7), "12.mp3"),
                  bits(Color(0xFF00F5A0), Color(0xFF00D9F5), "13.mp3"),
                  bits(Color(0xFF00F5A0), Color(0xFF00D9F5), "14.mp3"),
                  bits(Color(0xFF00F5A0), Color(0xFF00D9F5), "15.mp3"),
                  bits(Color(0xFF00F5A0), Color(0xFF00D9F5), "16.mp3"),
                  bits(Color(0xFF02AAB0), Color(0xFF00CDAC), "17.mp3"),
                  bits(Color(0xFF02AAB0), Color(0xFF00CDAC), "18.mp3"),
                  bits(Color(0xFF02AAB0), Color(0xFF00CDAC), "19.mp3"),
                  bits(Color(0xFF02AAB0), Color(0xFF00CDAC), "27.wav"),
                  bits(Color(0xFF3A7BD5), Color(0xFF00D2FF), "21.mp3"),
                  bits(Color(0xFF3A7BD5), Color(0xFF00D2FF), "22.wav"),
                  bits(Color(0xFF3A7BD5), Color(0xFF00D2FF), "23.wav"),
                  bits(Color(0xFF3A7BD5), Color(0xFF00D2FF), "22.wav"),
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}

class bits extends StatefulWidget {
  final Color centercolor;
  final Color bottomcolor;
  final String note;
  const bits(this.centercolor, this.bottomcolor, this.note, {Key? key});

  @override
  State<bits> createState() => _bitsState();
}

class _bitsState extends State<bits> {
  late Color _centercolor;
  late Color _bottomcolor;
  final players = AudioPlayer();
  @override
  void initState() {
    _centercolor = widget.centercolor;
    _bottomcolor = widget.bottomcolor;
    //player.play(AssetSource(widget.note));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        setState(() {
          _centercolor = Colors.white;
          _bottomcolor = Colors.white;
         players.play(AssetSource(widget.note));
        });

        await Future.delayed(Duration(milliseconds: 100));
        setState(() {
          _centercolor = widget.centercolor;
          _bottomcolor = widget.bottomcolor;
        });
      },

      child: Container(
        height: height/ 8.2,
        width: width / 4.2,
        //margin: EdgeInsets.all(5),
        
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [_centercolor, _bottomcolor]),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.shade100,
              offset: const Offset(2.0, 2.0),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
