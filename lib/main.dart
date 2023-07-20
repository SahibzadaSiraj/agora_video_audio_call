import 'package:agora_task/data/routes.dart';
import 'package:agora_task/domain/video_audio_call_agora_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider.value(value: VideoController()),
    ], child: MaterialApp(initialRoute: '/', routes: myRoutes)));
