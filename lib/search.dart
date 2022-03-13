import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:tennis_app/widgets/player_widgets.dart';
import 'package:tennis_app/widgets/inputs.dart';

class SearchPage extends StatefulWidget {

  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';
  late List<Player> players;

  @override
  void initState() {
    super.initState();
    players = allPlayers;
  }

  void searchPlayer(String query) {
    final players = allPlayers.where((player){
      final name = player.firstName + ' ' + player.lastName;
      final nameLower = name.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.players = players;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: <Widget>[
          SearchBar(
            text: query, 
            onChanged: searchPlayer, 
            hintText: 'Search'
          ),
          Expanded(
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (context,index){
                return PlayerTile(
                  fisrtName: players[index].firstName, 
                  lastName: players[index].lastName
                );
              }
            ),
          )
        ],
      ),
    );
  }
}

class Player{
  final String firstName;
  final String lastName;

  const Player({
    required this.firstName,
    required this.lastName
  });
}

final List<Player> allPlayers = List.generate(
  50, 
  (index) => Player(
    firstName: faker.person.firstName(),
    lastName: faker.person.lastName(),
  )
);