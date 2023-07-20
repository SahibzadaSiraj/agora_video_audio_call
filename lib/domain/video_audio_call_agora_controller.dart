import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_task/data/constant.dart';
import 'package:flutter/material.dart';

class VideoController with ChangeNotifier {
  static void join(RtcEngine agoraEngine) async {
    await agoraEngine.startPreview();

    // Set channel options including the client role and channel profile
    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    );

    await agoraEngine.joinChannel(
      token: AppConstants.token,
      channelId: AppConstants.channelName,
      options: options,
      uid: 0,
    );
  }
}
