import 'package:agora_task/data/constant.dart';
import 'package:agora_task/presentation/custom_widgets/app_bar.dart';
import 'package:agora_task/presentation/custom_widgets/text_wigdet.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(
          title: AppConstants.selectionAppBar, isBack: false, context: context),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              minWidth: size.width * 0.8,
              color: AppConstants.primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed("/audio");
              },
              child: TextWidget(
                title: "Voice Call",
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              minWidth: size.width * 0.8,
              color: AppConstants.primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed("/video");
              },
              child: TextWidget(
                title: "Video Call",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
