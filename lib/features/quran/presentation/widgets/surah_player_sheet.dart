import 'dart:async';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SurahPlayerSheet extends StatefulWidget {
  const SurahPlayerSheet({
    super.key,
    required this.name,
    required this.audioUrl,
  });

  final String name;
  final String audioUrl;

  @override
  State<SurahPlayerSheet> createState() => _SurahPlayerSheetState();
}

class _SurahPlayerSheetState extends State<SurahPlayerSheet> {
  final player = AudioPlayer();
  Duration? audioDuration;
  Duration? currentPositionDuration;
  PlayerState? playerState;

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  _initPlayer() async {
    try {
      final totalDuration = await player.getDuration();
      final currentPosition =
          await player.getCurrentPosition() ?? Duration.zero;

      setState(() {
        audioDuration = totalDuration;
        currentPositionDuration = currentPosition;
        playerState = player.state;
      });

      _durationSubscription = player.onDurationChanged.listen((duration) {
        setState(() {
          audioDuration = duration;
        });
      });

      _positionSubscription = player.onPositionChanged.listen((position) {
        setState(() {
          currentPositionDuration = position;
        });
      });

      _playerStateChangeSubscription =
          player.onPlayerStateChanged.listen((state) {
        setState(() {
          playerState = state;
        });
      });

      _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
        setState(() {
          playerState = PlayerState.stopped;
          currentPositionDuration = Duration.zero;
        });
      });
    } catch (e) {
      log("ERROR INIT AUDIO PLAYER: ${e.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();
    player.setSourceUrl(widget.audioUrl);
    _initPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    super.dispose();
  }

  void _handleTogglePlayer() async {
    if (playerState == PlayerState.playing) {
      await player.pause();
      return;
    }

    await player.resume();
  }

  void _handleSeekPlayer(double value) {
    if (audioDuration == null) return;

    final position = value * audioDuration!.inMilliseconds;

    player.seek(Duration(milliseconds: position.round()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Ink(
          height: 220,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Slider(
                onChanged: _handleSeekPlayer,
                value:
                    (audioDuration != null && currentPositionDuration != null)
                        ? currentPositionDuration!.inMilliseconds /
                            audioDuration!.inMilliseconds
                        : 0.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(currentPositionDuration?.inMinutes ?? 0) < 10 ? '0${currentPositionDuration?.inMinutes}' : currentPositionDuration?.inMinutes}:${((currentPositionDuration?.inSeconds ?? 0) % 60) < 10 ? '0${((currentPositionDuration?.inSeconds ?? 0) % 60)}' : ((currentPositionDuration?.inSeconds ?? 0) % 60)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Text(
                      '${(audioDuration?.inMinutes ?? 0) < 10 ? '0${audioDuration?.inMinutes}' : audioDuration?.inMinutes}:${((audioDuration?.inSeconds ?? 0) % 60) < 10 ? '0${((audioDuration?.inSeconds ?? 0) % 60)}' : ((audioDuration?.inSeconds ?? 0) % 60)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: InkWell(
                  onTap: _handleTogglePlayer,
                  child: Ink(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade900,
                      borderRadius: BorderRadius.circular(48),
                    ),
                    child: Center(
                      child: Icon(
                        playerState == PlayerState.playing
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
