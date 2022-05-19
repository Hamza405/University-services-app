import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? colorText;
  final Color? colorIcon;
  const CustomButton({
    required this.title,
    required this.icon,
    required this.onPressed,
    this.colorText = Colors.white,
    this.colorIcon = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.purple, Colors.pinkAccent],
        ),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon, color: colorIcon),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(color: colorText!.withOpacity(0.7)),
            )
          ],
        ),
      ));
}
