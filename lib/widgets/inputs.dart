import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:tennis_app/models/user.dart';

//
//////////// DATETIME FIELDS
//=======================================================
class DateInputWidget extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onClicked;

  const DateInputWidget({
    Key? key,
    required this.title,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: GestureDetector(
          onTap: onClicked,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    // width: 277,
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
              ),
            ],
          )),
    );
  }
}

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime date = DateTime.now();

  String getText() {
    // ignore: unnecessary_null_comparison
    if (date == null) {
      return 'Select Date';
    } else {
      return DateFormat('MM/dd/yyyy').format(date);
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) => DateInputWidget(
        title: 'Date',
        text: getText(),
        onClicked: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date, //date ?? initialDate
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppTheme.colors.grassGreen,
            ),
          ), // This will change to light theme.
          child: child!,
        );
      },
    );
    if (newDate == null) return;

    setState(() => date = newDate);
  }
}

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({Key? key}) : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late TimeOfDay time = const TimeOfDay(hour: 9, minute: 00);

  String getText() {
    if (time == null) {
      return 'Select Time';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  @override
  Widget build(BuildContext context) => DateInputWidget(
        title: 'Time',
        text: getText(),
        onClicked: () => pickTime(context),
      );

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppTheme.colors.grassGreen,
            ),
          ), // This will change to light theme.
          child: child!,
        );
      },
    );

    if (newTime == null) return;

    setState(() => time = newTime);
  }
}

//
//////////// SEARCH FIELDS
//=======================================================
class SearchBar extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchBar({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: AppTheme.colors.totallyBlack);
    const styleHint = TextStyle(
      color: Color(0xFF6C6C6C),
      // fontSize: 14,
      fontFamily: "Nunito",
      fontWeight: FontWeight.w700,
    );
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 40,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        style: style,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
          icon: Icon(Icons.search, color: style.color),
        ),
      ),
    );
  }
}

//
//////////// TEXT INPUT FIELDS
//=======================================================
class InputField extends StatefulWidget {
  final String? hinttext;
  final String labeltext;
  final User user;

  const InputField({
    this.hinttext,
    required this.labeltext,
    required this.user,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final surNameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    surNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        onChanged: (text) {
          setState(() {
            widget.user.firstName = surNameController.text;
          });
        },
        controller: surNameController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: widget.hinttext,
          labelText: widget.labeltext,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class SurnameInputField extends StatefulWidget {
  final String? hinttext;
  final String labeltext;
  final User user;

  const SurnameInputField({
    this.hinttext,
    required this.labeltext,
    required this.user,
  });

  @override
  State<SurnameInputField> createState() => _SurnameInputFieldState();
}

class _SurnameInputFieldState extends State<SurnameInputField> {
  final textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        onChanged: (text) {
          setState(() {
            widget.user.lastName = textController.text;
          });
        },
        controller: textController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: widget.hinttext,
          labelText: widget.labeltext,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class PhoneInputField extends StatefulWidget {
  final String? hinttext;
  final String labeltext;
  final User user;

  const PhoneInputField({
    this.hinttext,
    required this.labeltext,
    required this.user,
  });

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  final textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        onChanged: (text) {
          setState(() {
            widget.user.phone = textController.text;
          });
        },
        controller: textController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: widget.hinttext,
          labelText: widget.labeltext,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class EmailInputField extends StatefulWidget {
  final String? hinttext;
  final String labeltext;
  final User user;

  const EmailInputField({
    this.hinttext,
    required this.labeltext,
    required this.user,
  });

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  final textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        onChanged: (text) {
          setState(() {
            widget.user.email = textController.text;
          });
        },
        controller: textController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: widget.hinttext,
          labelText: widget.labeltext,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class FbSocialInputField extends StatefulWidget {
  final String? hinttext;
  final String labeltext;
  final SocialMedia social;

  const FbSocialInputField({
    this.hinttext,
    required this.labeltext,
    required this.social,
  });

  @override
  State<FbSocialInputField> createState() => _FbSocialInputFieldState();
}

class _FbSocialInputFieldState extends State<FbSocialInputField> {
  final Controller = TextEditingController();
  late bool changed = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        onChanged: (text) {
          setState(() {
            changed = true;
            widget.social.facebookLink = Controller.text;
          });
        },
        controller: Controller,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: widget.hinttext,
          labelText: widget.labeltext,
        ),
      ),
    );
  }
}

class IgSocialInputField extends StatefulWidget {
  final String? hinttext;
  final String labeltext;
  final SocialMedia social;

  const IgSocialInputField({
    this.hinttext,
    required this.labeltext,
    required this.social,
  });

  @override
  State<IgSocialInputField> createState() => _IgSocialInputFieldState();
}

class _IgSocialInputFieldState extends State<IgSocialInputField> {
  final Controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        onChanged: (text) {
          setState(() {
            widget.social.instagramLink = Controller.text;
          });
        },
        controller: Controller,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: widget.hinttext,
          labelText: widget.labeltext,
        ),
      ),
    );
  }
}

class VbSocialInputField extends StatefulWidget {
  final String? hinttext;
  final String labeltext;
  final SocialMedia social;

  const VbSocialInputField({
    this.hinttext,
    required this.labeltext,
    required this.social,
  });

  @override
  State<VbSocialInputField> createState() => _VbSocialInputFieldState();
}

class _VbSocialInputFieldState extends State<VbSocialInputField> {
  final Controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        onChanged: (text) {
          setState(() {
            widget.social.viberLink = Controller.text;
          });
        },
        controller: Controller,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: widget.hinttext,
          labelText: widget.labeltext,
        ),
      ),
    );
  }
}
