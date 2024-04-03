import 'package:flutter/material.dart';
import 'package:zoom_clone_app/utils/colors.dart';

class CustomButtons extends StatelessWidget {
  final String textChild;
  final VoidCallback callback;
  const CustomButtons(
      {super.key, required this.textChild, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(18),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            side: const BorderSide(color: buttonColor),
            backgroundColor: buttonColor,
            minimumSize: const Size(double.infinity, 50)),
        onPressed: () {
          callback();
        },
        child: Text(textChild, style: const TextStyle(fontSize: 17)));
  }
}

class HomeCustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeCustomButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.06),
                        offset: const Offset(0, 4))
                  ],
                  color: buttonColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(text, style: const TextStyle(color: Colors.grey, fontSize: 12))
          ],
        ));
  }
}

class MeetingOptions extends StatelessWidget {
  final String text;
  final bool isMuted;
  final Function(bool) onChangedCallback;
  const MeetingOptions(
      {super.key,
      required this.text,
      required this.isMuted,
      required this.onChangedCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Switch.adaptive(value: isMuted, onChanged: onChangedCallback)
        ],
      ),
    );
  }
}
