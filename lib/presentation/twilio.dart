import 'package:agora_task/data/constant.dart';
import 'package:agora_task/domain/twillio_controller.dart';
import 'package:agora_task/presentation/custom_widgets/app_bar.dart';
import 'package:agora_task/presentation/custom_widgets/text_wigdet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TwilioScreen extends StatefulWidget {
  const TwilioScreen({super.key});

  @override
  State<TwilioScreen> createState() => _TwilioScreenState();
}

class _TwilioScreenState extends State<TwilioScreen> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final twilioController = Provider.of<TwillioController>(context);
    return Scaffold(
      appBar: customAppBar(
          title: AppConstants.twilioText, isBack: true, context: context),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: textController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    borderSide: BorderSide(width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: '+447440488904',
                  labelText: 'Enter phone nnumber',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  suffixStyle: TextStyle(color: Colors.green),
                ),
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
                if (textController.text.isNotEmpty) {
                  twilioController
                      .twilioCallAPI(textController.text)
                      .then((value) {
                    if (value.statusCode == 201) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Call request sent successfully!")));
                      textController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Request wennt wrong: ${value.statusCode}")));
                    }
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("enter correct format")));
                }
              },
              child: TextWidget(
                title: "Call",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
