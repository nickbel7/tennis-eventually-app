import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';

class SimpleButton extends StatelessWidget {

  final Color fillcolor;
  final Color textcolor;
  final String text;
  final double height;
  final double width;
  final VoidCallback? onClick;

  const SimpleButton({
    Key? key,
    required this.fillcolor,
    required this.textcolor,
    required this.text,
    required this.width,
    required this.height,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: fillcolor,
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textcolor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconButtonCustom extends StatelessWidget {

  final String text;
  final double height;
  final double width;

  final VoidCallback? onClick;

  const IconButtonCustom({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: AppTheme.colors.amazonGreen,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.sports_baseball,
              color: AppTheme.colors.tennisBall,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.colors.backdrop,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonOutlined extends StatelessWidget {
  
  final String text;
  final double height;
  final double width;

  final VoidCallback? onClick;

  const ButtonOutlined({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: AppTheme.colors.backdrop,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0x0F000000)),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.5,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.colors.amazonGreen,
              ),
            ),
          ),
        ),
      ),
    );
  }
}