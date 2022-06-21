import 'package:flutter/material.dart';

class CustomTextDetail extends StatelessWidget {
  const CustomTextDetail({Key? key, required this.title, required this.content})
      : super(key: key);

  final String title, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Text(
          content,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
