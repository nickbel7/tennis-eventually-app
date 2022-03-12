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
    Key? key,
    required this.bordercolor,
    required this.fillcolor,
    required this.textcolor,
    required this.text,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Click");
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: fillcolor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: bordercolor),
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
        )
      )
    );
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
  final Color bordercolor;
  final Color fillcolor;
  final Color textcolor;
  final String text;
  final double height;
  final double width;
  // final Icon icon_type;

  const IconicButton({
    required this.bordercolor,
    required this.fillcolor,
    required this.textcolor,
    required this.text,
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
              color: fillcolor,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: bordercolor),
              boxShadow: const [
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
                const Icon(Icons.sports_baseball_outlined),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(text, style: TextStyle(color: textcolor))),
              ],
            )));
  }
}

class DateInputWidget extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onClicked;

  const DateInputWidget({
    required this.title,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onClicked,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 277,
                height: 38,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(text),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(Icons.calendar_today),
                    ),
                  ],
                )),
          ],
        ));
  }
}
