import 'package:agora_task/presentation/selection_screen.dart';
import 'package:agora_task/presentation/video_call.dart';
import 'package:agora_task/presentation/voice_call.dart';
import 'package:flutter/material.dart';

var myRoutes = <String, WidgetBuilder>{
  '/': (context) => const SelectionScreen(),
  '/video': (context) => const VideoCallPage(),
  '/audio': (context) => const VoiceCall(),
};
