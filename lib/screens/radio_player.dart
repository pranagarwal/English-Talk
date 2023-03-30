import 'package:english_talk/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:radio_player/radio_player.dart';

class RadioPlay extends StatefulWidget {
  @override
  _RadioPlayState createState() => _RadioPlayState();
}

class _RadioPlayState extends State<RadioPlay> {
  double val = 0.5;
  RadioPlayer _radioPlayer = RadioPlayer();
  bool isPlaying = false;
  List<String>? metadata;

  @override
  void initState() {
    super.initState();
    initRadioPlayer();
  }

  void initRadioPlayer() {
    _radioPlayer.setChannel(
      title: 'Radio Player',
      url: 'http://stream-uk1.radioparadise.com/aac-320',
      imagePath: 'assets/images/drawing2.png',
    );

    _radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });

    _radioPlayer.metadataStream.listen((value) {
      setState(() {
        metadata = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/images/radio.jpg',
          ),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                  future: _radioPlayer.getArtworkImage(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    Image artwork;
                    if (snapshot.hasData) {
                      artwork = snapshot.data;
                    } else {
                      artwork = Image.asset(
                        'assets/images/drawing2.png',
                        fit: BoxFit.cover,
                      );
                    }
                    return Container(
                      height: 180,
                      width: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: artwork,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 60),
                Text(
                  metadata?[0] ?? 'Click on Play',
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  metadata?[1] ?? '',
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 50),
                SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.white.withOpacity(0.2),
                    thumbColor: Colors.white,
                    overlayColor: Colors.white,
                    trackHeight: 10.0,
                    thumbShape: const RoundSliderThumbShape(
                      disabledThumbRadius: 10,
                      enabledThumbRadius: 10,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 10,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.volume_mute,
                        color: Colors.blueAccent,
                        size: 30.0,
                      ),
                      Slider(
                        max: 1.0,
                        min: 0.0,
                        value: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                      ),
                      Icon(
                        Icons.volume_up,
                        color: Colors.blueAccent,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button1(
                        icon: Icons.play_circle,
                        onPress: () {
                          _radioPlayer.play();
                        },
                      ),
                      Button1(
                        icon: Icons.pause_circle,
                        onPress: () {
                          _radioPlayer.pause();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
