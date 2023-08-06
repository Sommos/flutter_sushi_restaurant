import "package:flutter/material.dart";

class MyButton extends StatelessWidget {
  final String text;

  const MyButton({
    super.key,
    required this.text,  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(109, 140, 94, 91),
        borderRadius: BorderRadius.circular(40.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),

          const SizedBox(width: 10.0),

          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}