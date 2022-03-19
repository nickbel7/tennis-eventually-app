import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faker/faker.dart';
import 'package:tennis_app/widgets/buttons.dart';
import 'package:tennis_app/widgets/headers.dart';
import 'package:tennis_app/profile_edit.dart';
import 'package:tennis_app/models/user.dart';
import 'package:tennis_app/widgets/inputs.dart';

class ProfilePage extends StatefulWidget {
  // final bool isEditable;

  const ProfilePage({
    // required this.isEditable,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User user = User(
      firstName: faker.person.firstName(),
      lastName: faker.person.lastName(),
      phone: faker.phoneNumber.us(),
      email: faker.internet.email(),
      ratingvalue: 3);

  late SocialMedia social = SocialMedia(
      facebookLink: 'www.facebook.com',
      instagramLink: 'www.instagram.com',
      viberLink: 'www.viber.com');

  void _pushEditPage(BuildContext context) async {
    var result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: AppTheme.colors.grassGreen,
          centerTitle: true,
          title: const Text('Tennis EveNTUAlly',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: ProfileEditPage(
          user: user,
        ),
      );
    }));
    setState(() {
      user = result;
    });

    // ScaffoldMessenger.of(context)
    //   ..removeCurrentSnackBar()
    //   ..showSnackBar(SnackBar(content: Text(user.firstName)));
  }

  Widget _addSocialLinks(BuildContext context) {
    return Hero(
      social: social,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _stars = List.generate(
      user.ratingvalue.toInt(),
      (index) => Icon(
        Icons.star,
        color: AppTheme.colors.totallyBlack,
        size: 26,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  _pushEditPage(context);
                },
                //////profile edit page

                child: const Icon(Icons.edit),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: Image.asset(
                      "assets/avatar.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                    // height: 150,
                    margin: const EdgeInsets.only(left: 10),
                    child: ProfileInfoContainer(
                      user: user,
                    )),
              ),
            ],
          ),
          // SOCIAL ICONS
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 5),
              IconButton(
                  icon: Icon(FontAwesomeIcons.whatsapp,
                      color: AppTheme.colors.totallyBlack, size: 30.0),
                  onPressed: () {
                    var url = social.viberLink;
                  }),
              const SizedBox(width: 25),
              IconButton(
                icon: Icon(FontAwesomeIcons.instagram,
                    color: AppTheme.colors.totallyBlack, size: 30.0),
                onPressed: () {
                  var url = social.instagramLink;
                },
              ),
              const SizedBox(width: 25),
              IconButton(
                icon: Icon(FontAwesomeIcons.facebookF,
                    color: AppTheme.colors.totallyBlack, size: 25.0),
                onPressed: () {
                  var url = social.facebookLink;
                },
              ),
              const SizedBox(width: 5),
              //////////////Only to profile edit
              IconButton(
                icon: Icon(Icons.add_circle_outline_rounded,
                    color: AppTheme.colors.totallyBlack, size: 30.0),
                onPressed: () async {
                  final SocialMedia = await showDialog(
                    context: context,
                    builder: (BuildContext context) => _addSocialLinks(context),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              const SectionHeader(header: "Level"),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _stars,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: Image.asset(
                      "assets/QR_code.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SimpleButton(
                  fillcolor: AppTheme.colors.grassGreen,
                  textcolor: AppTheme.colors.totallyBlack,
                  text: "SCAN ME",
                  width: 200,
                  height: 40,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class Hero extends StatefulWidget {
  final SocialMedia social;

  const Hero({
    required this.social,
  });
  @override
  State<Hero> createState() => _HeroState();
}

class _HeroState extends State<Hero> {
  void _popSubmit(BuildContext context) async {
    Navigator.pop(context, widget.social);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Nice! Your social media links changed'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit'),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            FbSocialInputField(
              labeltext: "Facebook Link",
              social: widget.social,
            ),
            IgSocialInputField(
              labeltext: "Instagram Link",
              social: widget.social,
            ),
            VbSocialInputField(
              labeltext: "What's up Link",
              social: widget.social,
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: SimpleButton(
            fillcolor: AppTheme.colors.amazonGreen,
            textcolor: AppTheme.colors.totallyWhite,
            text: "ADD",
            width: 130,
            height: 27,
            onClick: () {
              _popSubmit(context);
            },
          ),
        )
      ],
    );
  }
}

class ProfileInfoContainer extends StatefulWidget {
  final User user;

  const ProfileInfoContainer({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ProfileInfoContainer> createState() => _ProfileInfoContainerState();
}

class _ProfileInfoContainerState extends State<ProfileInfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name : ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: AppTheme.colors.amazonGreen,
          ),
        ),
        Text(
          widget.user.firstName + " " + widget.user.lastName,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Phone : ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: AppTheme.colors.amazonGreen,
          ),
        ),
        Text(
          (widget.user.phone),
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Email : ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: AppTheme.colors.amazonGreen,
          ),
        ),
        Text(
          (widget.user.email),
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
