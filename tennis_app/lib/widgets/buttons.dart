import 'package:flutter/material.dart';

/*Sample Calling Function
SimpleButton(
  bordercolor: Colors.teal.shade900,
  fillcolor: Colors.teal.shade900,
  textcolor: Colors.white,
  text: "BUTTON",
  width: 204,
  height: 36,
) */

class SimpleButton extends StatelessWidget {
  final Color bordercolor;
  final Color fillcolor;
  final Color textcolor;
  final String text;
  final double height;
  final double width;

  const SimpleButton({
    required this.bordercolor,
    required this.fillcolor,
    required this.textcolor,
    required this.text,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("Click");
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: fillcolor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: bordercolor),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(3, 3))
            ],
          ),
          child: Center(child: Text(text, style: TextStyle(color: textcolor))),
        ));
  }
}

/*Sample Calling Function 
IconicButton(
  bordercolor_i: Colors.purple.shade900,
  fillcolor_i: Colors.purple.shade900,
  textcolor_i: Colors.red.shade50,
  text_i: "Book Court",
  width: 204,
  height: 50,
)
*/
class IconicButton extends StatelessWidget {
  final Color bordercolor_i;
  final Color fillcolor_i;
  final Color textcolor_i;
  final String text_i;
  final double height;
  final double width;
  // final Icon icon_type;

  const IconicButton({
    required this.bordercolor_i,
    required this.fillcolor_i,
    required this.textcolor_i,
    required this.text_i,
    required this.width,
    required this.height,
    // required this.icon_type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: fillcolor_i,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: bordercolor_i),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(3, 3))
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.sports_baseball_outlined),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(text_i, style: TextStyle(color: textcolor_i))),
              ],
            )));
  }
}
