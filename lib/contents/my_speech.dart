import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';

import '../widget_folder/color_widget.dart';

class MySpeech extends StatefulWidget {
  const MySpeech({Key? key}) : super(key: key);

  @override
  _MySpeechState createState() => _MySpeechState();
}

class _MySpeechState extends State<MySpeech> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    initializeAudio();
  }

  Future<void> initializeAudio() async {
    await _audioPlayer.setAsset('assets/audio/intro.mp3');

    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.loading ||
          playerState.processingState == ProcessingState.buffering) {
        setState(() {
          _isLoading = true;
        });
      } else if (playerState.processingState == ProcessingState.completed) {
        setState(() {
          _isLoading = false;
          _isPlaying = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _isPlaying = playerState.playing;
        });
      }
    });

    final playerState = await _audioPlayer.playerState;
    setState(() {
      _isLoading = false;
      _isPlaying = playerState.playing ;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> toggleAudio() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }

    setState(() {
      _isPlaying = _audioPlayer.playing ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleAudio,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.deepOrange.shade100,
        child: _isLoading
            ? const CircularProgressIndicator()
            :FaIcon(_isPlaying ? FontAwesomeIcons.pause :FontAwesomeIcons.play, size: 20, color: ColorWidget.colorBlack,)
      ),
    );
  }
}
