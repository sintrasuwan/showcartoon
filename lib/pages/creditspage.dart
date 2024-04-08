import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class creditspage extends StatefulWidget {
  const creditspage({super.key});

  @override
  State<creditspage> createState() => _creditspageState();
}

class _creditspageState extends State<creditspage> {
  Widget _text({required String detail,required double size}) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          '$detail',
          style: TextStyle(
            fontSize: size,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = Colors.blue[700]!,
          ),
        ),
        // Solid text as fill.
        Text(
          '$detail',
          style: TextStyle(
            fontSize: size,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 109, 195, 227),
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            width: 1,
          ),
          _text(detail: "CREDITS", size: 40),
          ElevatedButton(
            onPressed: () {
              AudioPlayer().play(AssetSource('music/toothlessmeme.mp3'));
            },
            child: Icon(
              Icons.music_note,
              color: Colors.blue,
            ),
          )
        ]),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/background/7dbbab34023e658856e15f9495a1e427.jpg'),
                fit: BoxFit.cover)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 40,
              ),
              _text(detail: "ผู้พัฒนา", size: 20),
              _text(detail: "นายชนกัณต์ อินทรสุวรรณ์", size: 20),
              SizedBox(
                height: 40,
              ),
              _text(detail: "รูปภาพและเพลง", size: 20),
              _text(detail: "โดย", size: 20),
              _text(detail: "Google Chrome", size: 20),
              _text(detail: "https://www.youtube.com/watch?v=4t7BgyA7IOI", size: 20),
              _text(detail: "https://www.y2mate.com/th/youtube", size: 20),
              SizedBox(
                height: 40,
              ),
              _text(detail: "ข้อมูล", size: 20),
              _text(detail: "โดย", size: 20),
              _text(detail: "https://api.sampleapis.com/cartoons/cartoons2D", size: 20),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/animatedGif/toothless-common.gif",
                    width: 165.0,
                  ),
                  Image.asset(
                    "assets/animatedGif/toothless-white.gif",
                    width: 165.0,
                  ),
                  Image.asset(
                    "assets/animatedGif/toothless-dancing.gif",
                    width: 165.0,
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
