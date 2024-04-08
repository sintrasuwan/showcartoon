import 'package:audioplayers/audioplayers.dart';
import 'package:showcartoon/pages/creditspage.dart';
import 'package:showcartoon/pages/startpage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:flame_audio/flame_audio.dart';

class menupage extends StatefulWidget {
  const menupage({super.key});

  @override
  State<menupage> createState() => _menupageState();
}

class _menupageState extends State<menupage> {
  //int count = 0;
  Widget _text({required String detail}) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          '$detail',
          style: TextStyle(
            fontSize: 40,
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
            fontSize: 40,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }

  Widget _startButton() {
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => startpage()),
          );
        });
      },
      child: Container(
          width: 200,
          height: 100,
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
            border: Border.all(color: Colors.black, width: 2),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlue],
            ),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(
              Icons.play_arrow,
              size: 60,
            ),
            Text(
              'Start',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ])),
    );
  }

  Widget _creditButton() {
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => creditspage()),
          );
        });
      },
      child: Container(
          width: 200,
          height: 100,
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
            border: Border.all(color: Colors.black, width: 2),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlue],
            ),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.credit_card,
              size: 60,
            ),
            Text(
              'Credits',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ])),
    );
  }

  Widget _toothlessCommonDance() {
    return Image.asset(
      "assets/animatedGif/toothless-common.gif",
      height: 125.0,
      width: 100.0,
    );
  }

  Widget _toothlessWhiteDance() {
    return Image.asset(
      "assets/animatedGif/toothless-white.gif",
      height: 125.0,
      width: 100.0,
    );
  }

  Widget _toothlessDancing() {
    return Image.asset(
      "assets/animatedGif/toothless-dancing.gif",
      height: 125.0,
      width: 100.0,
    );
  }

  Widget _toothlessLineDance() {
    return Row(children: [
      _toothlessCommonDance(),
      _toothlessWhiteDance(),
      _toothlessDancing(),
      _toothlessWhiteDance(),
      _toothlessCommonDance(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 160, 20, 167),
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            width: 50,
          ),
          _text(detail: "CARTOONS"),
          ElevatedButton(
            onPressed: () {
              AudioPlayer().play(AssetSource('music/toothlessmeme.mp3'));
            },
            child: Icon(Icons.music_note),
          )
        ]),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/background/toothless_and_light_fury_dance_meme_by_tsaoshin_dgp41gq-pre.jpg'),
                fit: BoxFit.cover)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              _toothlessLineDance(),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  _toothlessWhiteDance(),
                  SizedBox(
                    width: 30,
                  ),
                  _startButton(),
                  SizedBox(
                    width: 30,
                  ),
                  _toothlessWhiteDance(),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  _toothlessWhiteDance(),
                  SizedBox(
                    width: 30,
                  ),
                  _creditButton(),
                  SizedBox(
                    width: 30,
                  ),
                  _toothlessWhiteDance(),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              _toothlessLineDance(),
            ]),
          ],
        ),
      ),
    );
  }
}
