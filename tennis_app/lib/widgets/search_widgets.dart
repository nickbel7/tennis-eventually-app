import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: AppTheme.colors.totallyBlack);
    const styleHint = TextStyle(color: Color(0xFF6C6C6C),
                    // fontSize: 14,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w700,);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      // width: 328,
      height: 40,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black, width: 1, ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4, ),
      child: 
      TextField(
        controller: controller,
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
        textAlignVertical: TextAlignVertical.center,
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}

class PlayerTile extends StatelessWidget {
  final String fisrtName;
  final String lastName;

  const PlayerTile({
    Key? key,
    required this.fisrtName,
    required this.lastName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      // width: 328,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppTheme.colors.grassGreen,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5, ),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
              Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(color: AppTheme.colors.tennisBall, width: 1, ),
                  ),
                  child: Image.asset('assets/avatar.png'),
              ),
              SizedBox(width: 10),
              Text(
                  fisrtName + ' ' + lastName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppTheme.colors.totallyBlack,
                      fontSize: 14,
                  ),
              ),
          ],
      ),
  );
  }
}
