import 'package:flutter/material.dart';

class CustomProfile extends StatelessWidget {
  final Icon myIcon;
  final String myText;
  const CustomProfile({
    required this.myIcon,
    required this.myText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            myIcon,
            SizedBox(
              width: 10,
            ),
            Text(myText),
          ],
        ),
        Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
