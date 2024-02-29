import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double borderRadius;
  final VoidCallback onTap;
  final String text;
  final Color buttonColor;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.borderRadius,
    required this.onTap,
    required this.text,
    required this.buttonColor,
    required this.textColor,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
        widget.onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 40,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: isPressed
              ? null
              : const LinearGradient(
                  colors: [
                    Color(0XFF5E5E5E),
                    Color(0XFF3E3E3E),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
          color: isPressed ? widget.buttonColor : null,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: isPressed
              ? [
                  const BoxShadow(
                    color: Color(0XFF1E1E1E),
                  ),
                  const BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: Colors.black,
                  ),
                ]
              : [
                  BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 4,
                    color: const Color(0xFF000000).withOpacity(0.25),
                    offset: const Offset(2, 4),
                  )
                ],
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 18,
            color: isPressed ? const Color(0xFF5E5E5E) : widget.textColor,
          ),
        ),
      ),
    );
  }
}
