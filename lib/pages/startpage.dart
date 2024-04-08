import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:showcartoon/models/cartoon.dart';
//import 'package:firstgame/services/api_caller.dart';
import 'package:flutter/material.dart';
class startpage extends StatefulWidget {
  const startpage({super.key});

  @override
  State<startpage> createState() => _startpageState();
}

class _startpageState extends State<startpage> {
  List<Cartoon>? _cartoons;
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

  void _getCartoons() async {
    var dio = Dio(BaseOptions(responseType: ResponseType.plain));
    var response =
        await dio.get('https://api.sampleapis.com/cartoons/cartoons2D');
    List list = jsonDecode(response.data);

    setState(() {
      _cartoons = list.map((cartoon) => Cartoon.fromJson(cartoon)).toList();
      _cartoons!.sort((a, b) => a.title!.compareTo(b.title!));
    });
  }

  @override
  void initState() {
    super.initState();
    _getCartoons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 160, 20, 167),
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            width: 5,
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
      body: _cartoons == null
          ? SizedBox.shrink()
          : ListView.builder(
              itemCount: _cartoons!.length,
              itemBuilder: (context, index) {
                var cartoon = _cartoons![index];
                return ListTile(
                  title: Text(cartoon.title ?? ''),
                  subtitle: Text(cartoon.year.toString()),
                  trailing: cartoon.rating == ''
                      ? null
                      : Image.network(
                          cartoon.image ?? '',
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error, color: Colors.red);
                          },
                        ),
                  onTap: () {
                    print('You click ${cartoon.title}');
                    _showCartoon(index);
                  },
                );
              },
            ),
    );
  }

  Future<void> _showCartoon(index) async {
    var cartoon = _cartoons![index];
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            Text(
              cartoon.title!,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 118, 6, 146),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Genre : ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 118, 6, 146),
                ),
              ),
              for (var name in cartoon.genre!)
                Text(
                  name + ' ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 118, 6, 146),
                  ),
                ),
            ]),
            Text(
              'Rating : ' + cartoon.rating!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 118, 6, 146),
              ),
            ),
            Image.network(
              cartoon.image ?? '',
              width: 200,
              height: 200,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red);
              },
            ),
            Text(
              "Creator by",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 118, 6, 146),
              ),
            ),
            for (var name in cartoon.creator!)
              Text(
                name,
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 118, 6, 146),
                ),
              ),
            Text(
              'Year : ' + cartoon.year.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 118, 6, 146),
              ),
            ),
            Text(
              'Episodes : ' + cartoon.episodes.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 118, 6, 146),
              ),
            ),
            Text(
              'Runtime : ' + cartoon.runtime_in_minutes.toString() + ' minutes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 118, 6, 146),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
