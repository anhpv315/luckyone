

import 'package:audioplayers/audioplayers.dart';

class Audio{
  AudioPlayer _audioPlayer = new AudioPlayer();
  AudioCache _audioCache = AudioCache();
  String url = '';

  Audio(this.url); //local mp3 file in asset folder


  playLocal() async {
    _audioPlayer = await _audioCache.play(url);      //audio play function
  }

  pauseAudio() async {                 // audio pause
    await _audioPlayer.pause();}

  resumeAudio() async {
    await _audioPlayer.resume();                 //audio resume

  }

  stopAudio() async {
    if(_audioPlayer !=null){
      await _audioPlayer.stop();             //audio srope
    }
  }

}