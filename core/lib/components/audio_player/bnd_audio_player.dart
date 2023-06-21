import 'dart:async';
import 'dart:io';

import 'package:core/components/audio_player/const.dart';
import 'package:core/components/audio_player/seek_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class BndAudioPlayer extends StatefulWidget {
  final String url;
  final StreamController<String> pauseStream;

  const BndAudioPlayer({Key? key, required this.url, required this.pauseStream}) : super(key: key);

  @override
  _BndAudioPlayerState createState() => _BndAudioPlayerState();
}

class _BndAudioPlayerState extends State<BndAudioPlayer> with WidgetsBindingObserver {
  final AudioPlayer _player = AudioPlayer();

  StreamController<String> get _pauStream => widget.pauseStream;

  String get _url => widget.url;

  // bool _isError = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    _init();
  }

  Future<void> _init() async {
    _player.durationStream.listen((event) {
      // print(_player.playbackEvent.processingState);
    });
    _player.playbackEventStream.listen((PlaybackEvent event) {}, onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });

    try {
      final Uri uri = Uri.parse(_url);
      final LockCachingAudioSource _audioSource = LockCachingAudioSource(
        uri,
      );
      await _player.setAudioSource(Platform.isIOS ? _audioSource : AudioSource.uri(uri), preload: true);
    } catch (e) {
      // _isError = true;
      print("Error loading audio source: $e");
    }
    _pauStream.stream.listen((String urlPlayer) async {
      /// check this url = currentUrl && playing => pause
      if (urlPlayer != _url && _player.playing) {
        await _player.seek(Duration.zero);
        await _player.pause();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream => Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
      _player.positionStream,
      _player.bufferedPositionStream,
      _player.durationStream,
      (Duration position, Duration bufferedPosition, Duration? duration) =>
          PositionData(position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    // if (_isError) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.only(left: 16.0),
      height: 54,
      decoration: const BoxDecoration(color: Color(0xFFF5F6F9), borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Display play/pause button and volume/speed sliders.
          Expanded(flex: 1, child: ControlButtons(_player, _onPlayAudio)),
          // Display seek bar. Using StreamBuilder, this widget rebuilds
          // each time the position, buffered position or duration changes.
          Expanded(
            flex: 9,
            child: StreamBuilder<PositionData>(
              stream: _positionDataStream,
              builder: (BuildContext context, AsyncSnapshot<PositionData> snapshot) {
                final PositionData? positionData = snapshot.data;
                // print(  positionData?.duration);
                // _player.duration;
                return SeekBar(
                  duration: positionData?.duration ?? Duration.zero,
                  position: positionData?.position ?? Duration.zero,
                  bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
                  onChangeEnd: _player.seek,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onPlayAudio() {
    /// add stream all audio
    _pauStream.add(_url);
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;
  final Function onPlay;

  ControlButtons(this.player, this.onPlay);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (BuildContext context, AsyncSnapshot<PlayerState> snapshot) {
        final PlayerState? playerState = snapshot.data;
        final ProcessingState? processingState = playerState?.processingState;
        final bool? playing = playerState?.playing;
        if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
          return const CupertinoActivityIndicator();
        } else if (playing != true) {
          return GestureDetector(
            child: Icon(Icons.play_arrow, color: blackColor),
            onTap: () {
              player.play();
              onPlay();
            },
          );
        } else if (processingState != ProcessingState.completed) {
          return GestureDetector(
            child: Icon(Icons.pause, color: blackColor),
            onTap: player.pause,
          );
        } else {
          return GestureDetector(
            child: Icon(Icons.refresh, color: blackColor),
            onTap: () {
              player.seek(Duration.zero);
              onPlay();
            },
          );
        }
      },
    );
  }
}
